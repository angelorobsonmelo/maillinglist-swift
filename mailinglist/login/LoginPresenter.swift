import Foundation
import CoreData
import JWTDecode
import SwiftKeychainWrapper

class LoginPresenter: LoginPresenterContract {
  
    let view: LoginViewContract
    let getAuth: GetAuth
    let saveUser: SaveUser
    let getUser: GetUser
    
    init(view: LoginViewContract, getAuth: GetAuth, saveUser: SaveUser, getUser: GetUser) {
        self.view = view
        self.getAuth = getAuth
        self.saveUser = saveUser
        self.getUser  = getUser
    }
    
    func login(auth: Auth, isRemeberMe: Bool, with context: NSManagedObjectContext) {
        self.getAuth.auth(with: auth, onComplete: { (response) in
            if let myDictionary = response as? [String : AnyObject] {
                let data = myDictionary["data"]
                
                if let token = data as? [String : AnyObject] {
                    let jwtToken = token["token"] as! String
                    let userByDecodedToken = self.getUserByToken(jwtToken: jwtToken, with: context)
                    KeychainWrapper.standard.removeObject(forKey: "email")
                    KeychainWrapper.standard.removeObject(forKey: "password")
                    
                    if isRemeberMe {
                        KeychainWrapper.standard.set(auth.email, forKey: "email")
                        KeychainWrapper.standard.set(auth.password, forKey: "password")
                    }
                    
                    self.saveUser(user: userByDecodedToken, with: context)
                    
                } else {
                    self.view.showError(error: "E-mail or password incorrects" as AnyObject)
                }
            }
            
        }) { (error) in
            self.view.showError(error: error)
        }
    }
    
    private func getUserByToken(jwtToken: String, with context: NSManagedObjectContext) -> User {
        let jwtDecoded = try! decode(jwt: jwtToken)
        let jwtBody = jwtDecoded.body
        let user = User(context: context)

        user.id = (jwtBody["id"]! as? Int64)!
        user.firstname = jwtBody["firsttname"]! as? String
        user.lastname = jwtBody["lastname"]! as? String
        user.role      = jwtBody["role"]! as? String

        return user
    }
    
    func saveUser(user: User, with context: NSManagedObjectContext) {
        self.saveUser.save(with: user, with: context, onComplete: {
        _ in
            
        })
        {
        (error) in
            self.view.showError(error: error.description as AnyObject)
        }
    }
    
    func getUser(with context: NSManagedObjectContext) {
        self.getUser.getUser(with: context, onComplete: { (user) in
            self.view.showUser(user: user)
        }, empty: {
            
        }) { (error) in
            self.view.showError(error: error.description as AnyObject)
        }
    }
    
    
}

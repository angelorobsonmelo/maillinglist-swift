import Foundation
import CoreData

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
    
    func login(auth: Auth) {
        self.getAuth.auth(with: auth, onComplete: { (response) in
            if let myDictionary = response as? [String : AnyObject] {
                let data = myDictionary["data"]
                
                if let token = data as? [String : AnyObject] {
                    let jwtToken = token["token"] as! String
                    self.view.getToken(token: jwtToken)
                } else {
                    self.view.showError(error: "E-mail or password incorrects" as AnyObject)
                }
            }
            
        }) { (error) in
            self.view.showError(error: error)
        }
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

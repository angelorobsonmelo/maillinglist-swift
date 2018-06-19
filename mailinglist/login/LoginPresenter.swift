import Foundation

class LoginPresenter: LoginPresenterContract {
    
    let view: LoginViewContract
    let getAuth: GetAuth
    
    init(view: LoginViewContract, getAuth: GetAuth) {
        self.view = view
        self.getAuth = getAuth
    }
    
    func login(auth: Auth) {
        getAuth.auth(with: auth, onComplete: { (response) in
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
    
}

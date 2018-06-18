import Foundation

class LoginPresente: LoginPresenterContract {
    
    let view: LoginViewContract
    let getAuth: GetAuth
    
    init(view: LoginViewContract, getAuth: GetAuth) {
        self.view = view
        self.getAuth = getAuth
    }
    
    func login(auth: Auth) {
        
    }
    
    
}

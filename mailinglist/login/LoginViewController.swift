import UIKit
import JWTDecode
import SwiftKeychainWrapper

class LoginViewController: UIViewController, LoginViewContract {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var swRemeber: UISwitch!
    
    lazy var presenter: LoginPresenterContract = {
        return LoginPresenter(view: self,
                              getAuth: InjectionUseCase.provideGetAuth(),
                              saveUser: InjectionUseCase.provideSaveUser(),
                              getUser: InjectionUseCase.provideGetUser())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.getUser(with: context)
    }

    @IBAction func login(_ sender: Any) {
        let auth = Auth(with: tfEmail.text!, with: tfPassword.text!)
        presenter.login(auth: auth, isRemeberMe: swRemeber.isOn, with: context)
    }
    
    func showUser(user: User) {
        if let password = KeychainWrapper.standard.string(forKey: "password"), let email = KeychainWrapper.standard.string(forKey: "email") {
            tfEmail.text = email
            tfPassword.text = password
            swRemeber.isOn = true
        }
    }
    
    func showError(error: AnyObject) {
        print(error)
    }
    
    func userLogged(isLogged: Bool) {
        if isLogged {
            self.performSegue(withIdentifier: "rolesSegue", sender: self)
        }
    }
        
}
    

    


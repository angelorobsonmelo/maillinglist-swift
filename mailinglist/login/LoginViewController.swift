import UIKit
import JWTDecode

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
        presenter.getUser(with: context)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.getUser(with: context)
    }

    @IBAction func login(_ sender: Any) {
        let auth = Auth(with: tfEmail.text!, with: tfPassword.text!)
        presenter.login(auth: auth)
    }
    
    func getToken(token: String) {
     let jwt = try! decode(jwt: token)
     let jwtBody = jwt.body
     let user = User(context: context)
     
     user.id = (jwtBody["id"]! as? Int64)!
     user.firstname = jwtBody["firsttname"]! as? String
     user.lastname = jwtBody["lastname"]! as? String
     user.email     = jwtBody["sub"]! as? String
     user.role      = jwtBody["role"]! as? String
     
        if swRemeber.isOn {
            user.password = tfPassword.text!
        }
        
        presenter.saveUser(user: user, with: context)
    }
    
    func showError(error: AnyObject) {
        print(error)
    }
    
    func showUser(user: User) {
        if let password = user.password {
            tfEmail.text = user.email
            tfPassword.text = password
            swRemeber.isOn = true
        }
    }
    
        
}
    

    


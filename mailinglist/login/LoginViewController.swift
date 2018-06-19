import UIKit
import JWTDecode

class LoginViewController: UIViewController, LoginViewContract {
  
    @IBOutlet weak var lbEmail: UITextField!
    @IBOutlet weak var lbPassword: UITextField!
    @IBOutlet weak var swRemeber: UISwitch!
    
    lazy var presenter: LoginPresenterContract = {
        return LoginPresenter(view: self,
                              getAuth: GetAuth())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbEmail.text = "lojaaxionmaceio@gmail.com"
        lbPassword.text = "lojaaxion"
    }

    @IBAction func login(_ sender: Any) {
        let auth = Auth(with: lbEmail.text!, with: lbPassword.text!)
        presenter.login(auth: auth)
    }
    
    func getToken(token: String) {
     let jwt = try! decode(jwt: token)
     print(jwt.body)

    }
    
    func showError(error: AnyObject) {
        print(error)
    }
        
}
    

    


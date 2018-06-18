import UIKit

class LoginViewController: UIViewController, LoginViewContract {

    @IBOutlet weak var lbEmail: UITextField!
    @IBOutlet weak var lbPassword: UITextField!
    @IBOutlet weak var swRemeber: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(_ sender: Any) {
        print(lbEmail.text!)
        print(lbPassword.text!)
        print(swRemeber.isOn)
    }
    
    func getToken(token: String) {
        
    }
    
}

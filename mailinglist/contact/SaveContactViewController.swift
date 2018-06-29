//
//  SaveContactViewController.swift
//  mailinglist
//
//  Created by stant on 28/06/18.
//  Copyright © 2018 angelorobson. All rights reserved.
//

import UIKit

class SaveContactViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfUsernameInstagram: UITextField!
    @IBOutlet weak var tfCategory: UITextField!
    @IBOutlet weak var tfGender: UITextField!
    @IBOutlet weak var tfRoles: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tfUsernameInstagram:
            tfCategory.becomeFirstResponder()
            break
        case tfCategory:
             tfGender.becomeFirstResponder()
             break
        case tfGender:
             tfRoles.becomeFirstResponder()
            break
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }
   
    
    @IBAction func saveContact(_ sender: UIButton) {
        
    }
    
}

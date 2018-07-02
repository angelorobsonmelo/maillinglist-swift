//
//  ContactDetailViewController.swift
//  mailinglist
//
//  Created by stant on 02/07/18.
//  Copyright © 2018 angelorobson. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {

    var contact: Contact!
    
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lbUserNameInstagram: UILabel!
    @IBOutlet weak var lbCategory: UILabel!
    @IBOutlet weak var lbGender: UILabel!
    @IBOutlet weak var lbRoles: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        if contact.gender == "MALE" {
            ivAvatar.image = UIImage(named: "avatar_male")
        } else {
            ivAvatar.image = UIImage(named: "avatar_female")
        }
        
        lbUserNameInstagram.text = contact.userNameInstagram
        lbCategory.text = contact.category?.category
        lbGender.text = contact.gender
        lbRoles.text = "Some role 1, some role 3, some role 4, some role 5"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

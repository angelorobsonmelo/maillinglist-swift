//
//  ContactDetailViewController.swift
//  mailinglist
//
//  Created by stant on 02/07/18.
//  Copyright © 2018 angelorobson. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController, ContactDetailViewContract {
    
    
    var contact: Contact!
    
    
    @IBOutlet weak var ivAvatar: RoundedImageView!
    @IBOutlet weak var lbUserNameInstagram: UILabel!
    @IBOutlet weak var lbCategory: UILabel!
    @IBOutlet weak var lbGender: UILabel!
    @IBOutlet weak var lbRoles: UILabel!
    
    lazy var presenter: ContactDetailPresenter = {
        return ContactDetailPresenter(view: self, getContactUseCase: InjectionUseCase.provideGetContact())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)        
        if let id = contact.id {
        presenter.getContact(id: id)
        }
    }
    
    func showError(error: [String]) {
        
    }
    
    func showContact(contact: Contact) {
        self.contact =  contact
        if self.contact.gender == "MALE" {
            ivAvatar.image = UIImage(named: "avatar_male")
        } else {
            ivAvatar.image = UIImage(named: "avatar_female")
        }
        
        lbUserNameInstagram.text = self.contact.userNameInstagram
        lbCategory.text = self.contact.category?.category
        lbGender.text = self.contact.gender
        lbRoles.text = "Some role 1, some role 3, some role 4, some role 5"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "segueEditContact" {
            let vc = segue.destination as! SaveContactViewController
            vc.contact = contact
        }
    }

}

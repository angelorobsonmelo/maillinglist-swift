//
//  ContactTableViewController.swift
//  mailinglist
//
//  Created by Stant 02 on 26/06/18.
//  Copyright © 2018 angelorobson. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController, ContactViewContract {
    
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    var contacts: [Contact] = []
    var id: Int?
    var isEdited = false
    
    lazy var presenter: ContactPresenter = {
        return ContactPresenter(view: self, getContacts: InjectionUseCase.provideGetContacts(), deleteContact: InjectionUseCase.provideDeleteContact())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        label.text = "Please, wait..."
        let contactFilter = ContactFilter()
        presenter.getContacts(contactFilter: contactFilter)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier! == "segueContactDetail" {
                let vc = segue.destination as! ContactDetailViewController
                vc.contact = contacts[tableView.indexPathForSelectedRow!.row]
            }
    }
    
    func showContacts(response: ResponseBase<ContentObjects<Contact>>) {
        self.contacts = (response.data?.content)!
        self.tableView.reloadData()
    }
    
    func showError(error: [String]) {
        
    }
    
    func showContact(contact: Contact) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = contacts.count == 0 ? label : nil
        return contacts.count
    }
    
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 118
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactTableViewCell
        
        let contact = contacts[indexPath.row]
        cell.populateCell(with: contact)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let contact = contacts[indexPath.row]
            
            let refreshAlert = UIAlertController(title: "Remove", message: "Do you want to remove \(contact.userNameInstagram!)?", preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Remove", style: .default, handler: { (action: UIAlertAction!) in
                self.contacts.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.presenter.deleteContact(contact: contact)
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                return
            }))
            
            present(refreshAlert, animated: true, completion: nil)
        }
    }
    
    func deleteContract(isSuccess: Bool) {
        let contactFilter = ContactFilter()
        presenter.getContacts(contactFilter: contactFilter)
    }
 
}

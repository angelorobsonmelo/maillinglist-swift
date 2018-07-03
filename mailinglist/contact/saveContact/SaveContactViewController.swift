//
//  SaveContactViewController.swift
//  mailinglist
//
//  Created by stant on 28/06/18.
//  Copyright © 2018 angelorobson. All rights reserved.
//

import UIKit
import RSSelectionMenu

class SaveContactViewController: UIViewController, UITextFieldDelegate, SaveContactViewContract {
    
    @IBOutlet weak var tfUsernameInstagram: UITextField!
    @IBOutlet weak var btSelectCategory: UIButton!
    @IBOutlet weak var btSelectGender: UIButton!
    @IBOutlet weak var btSelectRoles: UIButton!
    
    var contact: Contact!
    
    let genders = ["MALE", "FEMALE"]
    var genderSelected = [String]()
    
    var categories: [Category] = []
    var categoriesSelected = [Category]()
    
    var roles: [Role] = []
    var rolesSelected = [Role]()
    
    var firstRowSelected = true
    
    lazy var presenter: SaveContactPresenter = {
        return SaveContactPresenter(view: self, getCategoriesUseCase: InjectionUseCase.provideGetCategories(), getRolesUseCase: InjectionUseCase.provideGetRoles(), saveContactUseCase: InjectionUseCase.provideSaveContact())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btSelectCategory.backgroundColor = .clear
        btSelectCategory.layer.borderWidth = 0.5
        btSelectCategory.layer.borderColor = UIColor.black.cgColor
        
        btSelectGender.backgroundColor = .clear
        btSelectGender.layer.borderWidth = 0.5
        btSelectGender.layer.borderColor = UIColor.black.cgColor
        
        btSelectRoles.backgroundColor = .clear
        btSelectRoles.layer.borderWidth = 0.5
        btSelectRoles.layer.borderColor = UIColor.black.cgColor
        
        if contact != nil {
            tfUsernameInstagram.text = contact.userNameInstagram
            btSelectCategory.setTitle(contact.category?.category, for: .normal)
            btSelectGender.setTitle(contact.gender, for: .normal)
            btSelectRoles.setTitle("\(String(describing: contact.roles!.count)) role(s) selected", for: .normal)
            
            categoriesSelected.append(contact.category!)
            genderSelected.append(contact.gender!)
            rolesSelected = contact.roles!
        }
        
        presenter.getCategories()
        presenter.getRoles()
    }
    
    func showError(error: [String]) {
        print(error)
    }
    
    func showCategories(categories: [Category]) {
        self.categories = categories
    }
    
    func showRoles(roles: [Role]) {
        self.roles = roles
    }
    
    @IBAction func showCategories(_ sender: UIButton) {
        showCategories()
    }
    
    @IBAction func showGenders(_ sender: UIButton) {
        showGenders()
    }
    
    @IBAction func showRoles(_ sender: UIButton) {
        showRoles()
    }
    
    func showContact(contact: Contact) {
        navigationController?.popViewController(animated: true)
    }
    
    func showCategories() {
        let selectionMenu = RSSelectionMenu(dataSource: categories) { (cell, object, indexPath) in
            cell.textLabel?.text = object.category
            cell.tintColor = UIColor(named: "main")
        }
        
        selectionMenu.setSelectedItems(items: categoriesSelected) { (text, selected, selectedItems) in
            self.categoriesSelected = selectedItems
            self.btSelectCategory.setTitle(text?.category, for: .normal)
        }
        
        selectionMenu.showSearchBar(withPlaceHolder: "Search Category", tintColor: UIColor.white.withAlphaComponent(0.3)) { (searchText) -> ([Category]) in
            return self.categories.filter({ ($0.category?.lowercased().hasPrefix(searchText.lowercased()))! })
        }
        
        selectionMenu.show(style: .Formsheet, from: self)
    }
    
  
    
    func showGenders() {
        let selectionMenu = RSSelectionMenu(dataSource: genders) { (cell, object, indexPath) in
            cell.textLabel?.text = object
            cell.tintColor = UIColor(named: "main")
        }
        
        selectionMenu.setSelectedItems(items: genderSelected) { (text, selected, selectedItems) in
            self.genderSelected = selectedItems
            self.btSelectGender.setTitle(text, for: .normal)
        }
        
        selectionMenu.showSearchBar(withPlaceHolder: "Search Gender", tintColor: UIColor.white.withAlphaComponent(0.3)) { (searchText) -> ([String]) in
            return self.genders.filter({ $0.lowercased().hasPrefix(searchText.lowercased()) })
        }
        
        selectionMenu.show(style: .Formsheet, from: self)
    }
    
    func showRoles() {
        let selectionMenu =  RSSelectionMenu(selectionType: .Multiple, dataSource: roles, cellType: .Basic) { (cell, object, indexPath) in
            cell.textLabel?.text = object.function
            cell.tintColor = UIColor(named: "main")
        }
        
        selectionMenu.setSelectedItems(items: rolesSelected) { (text, selected, selectedItems) in
            self.rolesSelected = selectedItems
            self.btSelectRoles.setTitle("\(self.rolesSelected.count) role(s) selected", for: .normal)
        }
        
    
        selectionMenu.showSearchBar { (searchtext) -> ([Role]) in
            return self.roles.filter({ ($0.function?.lowercased().hasPrefix(searchtext.lowercased()))! })
        }
        
        // set navigationbar theme
        selectionMenu.setNavigationBar(title: "", attributes: nil, barTintColor: UIColor.init(named: ("main")), tintColor: UIColor.white)
        
        // right barbutton title
        selectionMenu.rightBarButtonTitle = "Submit"
        
        selectionMenu.leftBarButtonTitle =  "Close"
        
        // show as default
        selectionMenu.show(from: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func saveContact(_ sender: UIButton) {
        var contact = Contact(gender: genderSelected.first!, userNameInstagram: tfUsernameInstagram.text!, category: categoriesSelected.first!, roles: rolesSelected)
        
        if self.contact?.id != nil {
            contact = Contact(id: self.contact.id!, gender: genderSelected.first!, userNameInstagram: tfUsernameInstagram.text!, category: categoriesSelected.first!, roles: rolesSelected)
        }
        
        presenter.saveContact(contact: contact)
    }
    
}

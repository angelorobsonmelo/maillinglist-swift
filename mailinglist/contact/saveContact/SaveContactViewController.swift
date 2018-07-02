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
    
    lazy var presenter: SaveContactPresenter = {
        return SaveContactPresenter(view: self, getCategoriesUseCase: InjectionUseCase.provideGetCategories())
    }()
    
    let simpleDataArray = ["Sachin", "Rahul", "Saurav", "Virat", "Suresh", "Ravindra", "Chris", "Steve", "Anil"]
    var simpleSelectedArray = [String]()
    
    let genders = ["MALE", "FEMALE"]
    var genderSelected = [String]()
    
    var categories: [Category] = []
    var categoriesSelected = [Category]()
    
    
    var firstRowSelected = true
    
    let dataArray = ["Sachin Tendulkar", "Rahul Dravid", "Saurav Ganguli", "Virat Kohli", "Suresh Raina", "Ravindra Jadeja", "Chris Gyle", "Steve Smith", "Anil Kumble"]
    
    var selectedDataArray = [String]()
    
    var customDataArray = [Person]()
    var customselectedDataArray = [Person]()
    
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
        
        presenter.getCategories()
    }
    
    func showError(error: [String]) {
        print(error)
    }
    
    func showCategories(categories: [Category]) {
        self.categories = categories
    }
    
    @IBAction func showCategories(_ sender: UIButton) {
        showCategories()
    }
    
    @IBAction func showGenders(_ sender: UIButton) {
        showGenders()
    }
    
    @IBAction func showRoles(_ sender: UIButton) {
        presentWithMultiSelectionAndSearch()
    }
    
    func showCategories() {
        let selectionMenu = RSSelectionMenu(dataSource: categories) { (cell, object, indexPath) in
            cell.textLabel?.text = object.category
            cell.tintColor = UIColor(named: "main")
        }
        
        selectionMenu.setSelectedItems(items: categoriesSelected) { (text, selected, selectedItems) in
            self.categoriesSelected = selectedItems
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
    
    func presentWithMultiSelectionAndSearch() {
        
        let selectionMenu =  RSSelectionMenu(selectionType: .Multiple, dataSource: dataArray, cellType: .SubTitle) { (cell, object, indexPath) in
            
            cell.textLabel?.text = object
            
            // Change tint color (if needed)
            cell.tintColor = UIColor(named: "main")
        }
        
        selectionMenu.setSelectedItems(items: selectedDataArray) { (text, selected, selectedItems) in
            self.selectedDataArray = selectedItems
        }
        
        // To show first row as All, when dropdown as All selected by default
        // Here you'll get Text and isSelected when user selects first row
        
        selectionMenu.addFirstRowAs(rowType: .All, showSelected: self.firstRowSelected) { (text, isSelected) in
            self.firstRowSelected = isSelected
        }
        
        // show searchbar
        // Here you'll get search text - when user types in seachbar
        selectionMenu.showSearchBar { (searchtext) -> ([String]) in
            return self.dataArray.filter({ $0.lowercased().hasPrefix(searchtext.lowercased()) })
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
        
    }
    
}

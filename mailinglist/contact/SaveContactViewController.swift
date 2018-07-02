//
//  SaveContactViewController.swift
//  mailinglist
//
//  Created by stant on 28/06/18.
//  Copyright © 2018 angelorobson. All rights reserved.
//

import UIKit
import RSSelectionMenu

class SaveContactViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfUsernameInstagram: UITextField!
    @IBOutlet weak var btSelectCategory: UIButton!
    @IBOutlet weak var btSelectGender: UIButton!
    @IBOutlet weak var btSelectRoles: UIButton!
    
    
    let simpleDataArray = ["Sachin", "Rahul", "Saurav", "Virat", "Suresh", "Ravindra", "Chris", "Steve", "Anil"]
    var simpleSelectedArray = [String]()
    
    let genders = ["MALE", "FEMALE"]
    var genderSelected = [String]()
    
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
    }
    
    @IBAction func showCategories(_ sender: UIButton) {
        showAsFormSheetWithSearch()
    }
    
    @IBAction func showGenders(_ sender: UIButton) {
        showGenders()
    }
    
    @IBAction func showRoles(_ sender: UIButton) {
        presentWithMultiSelectionAndSearch()
    }
    
    func showAsFormSheetWithSearch() {
        // Show menu with datasource array - PresentationStyle = Formsheet & SearchBar
        let selectionMenu = RSSelectionMenu(dataSource: dataArray) { (cell, object, indexPath) in
            cell.textLabel?.text = object
            
            // Change tint color (if needed)
            cell.tintColor = UIColor(named: "main")
        }
        
        // show selected items
        selectionMenu.setSelectedItems(items: selectedDataArray) { (text, selected, selectedItems) in
            self.selectedDataArray = selectedItems
        }
        
        // show searchbar with placeholder text and barTintColor
        // Here you'll get search text - when user types in seachbar
        selectionMenu.showSearchBar(withPlaceHolder: "Search Player", tintColor: UIColor.white.withAlphaComponent(0.3)) { (searchText) -> ([String]) in
            
            // return filtered array based on any condition
            // here let's return array where firstname starts with specified search text
            
            return self.dataArray.filter({ $0.lowercased().hasPrefix(searchText.lowercased()) })
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
        selectionMenu.setNavigationBar(title: "Select Role", attributes: nil, barTintColor: UIColor.init(named: ("main")), tintColor: UIColor.white)
        
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

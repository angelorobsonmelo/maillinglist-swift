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
    @IBOutlet weak var tfCategory: UITextField!
    @IBOutlet weak var tfGender: UITextField!
    @IBOutlet weak var tfRoles: UITextField!
    
    let simpleDataArray = ["Sachin", "Rahul", "Saurav", "Virat", "Suresh", "Ravindra", "Chris", "Steve", "Anil"]
    var simpleSelectedArray = [String]()
    
    var firstRowSelected = true
    
    let dataArray = ["Sachin Tendulkar", "Rahul Dravid", "Saurav Ganguli", "Virat Kohli", "Suresh Raina", "Ravindra Jadeja", "Chris Gyle", "Steve Smith", "Anil Kumble"]
    
    var selectedDataArray = [String]()
    
    var customDataArray = [Person]()
    var customselectedDataArray = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    func showAsFormSheetWithSearch() {
        
        // Show menu with datasource array - PresentationStyle = Formsheet & SearchBar
        let selectionMenu = RSSelectionMenu(dataSource: dataArray) { (cell, object, indexPath) in
            cell.textLabel?.text = object
            
            // Change tint color (if needed)
            cell.tintColor = UIColor.blue
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
        
        // get on dismiss event with selected items
//        selectionMenu.onDismiss = { selectedItems in
//            self.selectedDataArray = selectedItems
//        }
//
//        selectionMenu.dismiss(animated: true) {
//            
//        }
        
        // show as formsheet
        selectionMenu.show(style: .Formsheet, from: self)
    }
    
    func presentWithMultiSelectionAndSearch() {
        
        // Show menu with datasource array - SelectionType = Multiple, CellType = SubTitle & SearchBar
        
        let selectionMenu =  RSSelectionMenu(selectionType: .Multiple, dataSource: dataArray, cellType: .SubTitle) { (cell, object, indexPath) in
            
            // set firstname in title and lastname as subTitle
            
            let firstName = object.components(separatedBy: " ").first
            let lastName = object.components(separatedBy: " ").last
            
            cell.textLabel?.text = firstName
            cell.detailTextLabel?.text = lastName
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
        selectionMenu.setNavigationBar(title: "Select Player", attributes: nil, barTintColor: UIColor.orange.withAlphaComponent(0.5), tintColor: UIColor.white)
        
        // right barbutton title
        selectionMenu.rightBarButtonTitle = "Submit"
        
        // show as default
        selectionMenu.show(from: self)
    }
    
    
    func showAsPush() {
        
        // Show menu with datasource array - Default SelectionType = Single
        // Here you'll get cell configuration where you can set any text based on condition
        // Cell configuration following parameters.
        // 1. UITableViewCell   2. Object of type T   3. IndexPath
        
        let selectionMenu =  RSSelectionMenu(dataSource: simpleDataArray) { (cell, object, indexPath) in
            cell.textLabel?.text = object
            
            // Change tint color (if needed)
            cell.tintColor = UIColor.blue
        }
        
        selectionMenu.showSearchBar(withPlaceHolder: "Search Player", tintColor: UIColor.white.withAlphaComponent(0.3)) { (searchText) -> ([String]) in
            
            // return filtered array based on any condition
            // here let's return array where firstname starts with specified search text
            
            return self.dataArray.filter({ $0.lowercased().hasPrefix(searchText.lowercased()) })
        }
        
        // set navigation title
        selectionMenu.setNavigationBar(title: "Select Player")
        
        // set default selected items when menu present on screen.
        // Here you'll get onDidSelectRow
        
//        simpleSelectedArray =  simpleDataArray
        
        selectionMenu.setSelectedItems(items: simpleSelectedArray) { (text, isSelected, selectedItems) in
            
            // update your existing array with updated selected items, so when menu presents second time updated items will be default selected.
            self.simpleSelectedArray = selectedItems
        }
        
        
        // show as PresentationStyle = Push
        selectionMenu.show(style: .Push, from: self)
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == tfCategory {
            showAsFormSheetWithSearch()
//            presentWithMultiSelectionAndSearch()
//            showAsPush()
        }
    }
    
   
    
    @IBAction func saveContact(_ sender: UIButton) {
        
    }
    
}

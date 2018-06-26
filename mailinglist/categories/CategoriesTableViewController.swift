//
//  CategoriesTableViewController.swift
//  mailinglist
//
//  Created by stant on 25/06/18.
//  Copyright © 2018 angelorobson. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController, CategoryViewContract {
    
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    lazy var presenter: CategoryPresenterContract = {
        return CategoryPresenter(view: self, getCategories: InjectionUseCase.provideGetCategories(), saveCategory: InjectionUseCase.provideSaveCategory(), deleteCategory: InjectionUseCase.provideDeleteCategory())
    }()
    
    var categories: [Category] = []
    var id: Int?
    var isEdited = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        label.text = "Please, wait..."
        presenter.getCategories()
    }
    
    func showError(error: [String]) {
        print(error)
    }
    
    func showCategories(categories: [Category]) {
        self.categories = categories
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = categories.count == 0 ? label : nil
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].category
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = self.categories[indexPath.row]
        showAlertForm(with: category)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    @IBAction func addCategory(_ sender: UIBarButtonItem) {
        showAlertForm(with: nil)
    }
    
    func showAlertForm(with category: Category?) {
        let title = category == nil ? "Add" : "Edit"
        let alert = UIAlertController(title: title + " Category", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.clearButtonMode = .whileEditing
            textField.autocapitalizationType = .sentences
            textField.placeholder = "Category"
            textField.returnKeyType = .done
            if let id = category?.id {
                textField.text = category?.category!
                self.id = id
            }
        }
        
        alert.addAction(UIAlertAction(title: title, style: .default, handler: { (action) in
            let category = alert.textFields?.first?.text
            self.saveRole(category: category!)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.view.tintColor = UIColor(named: "second")
        present(alert, animated: true, completion: nil)
    }
    
    private func saveRole(category: String) {
        var categoryObj = Category(category: category)
        
        if let id = self.id {
            self.id = id
            self.isEdited = true
            categoryObj = Category(id: id, category: category)
            self.id = nil
        }
        
        self.presenter.saveCategory(category: categoryObj)
    }
    
    func showCategory(category: Category) {
        if self.isEdited {
            updateItem(updatedItem: category)
            self.isEdited = false
            return
        }
        
        self.categories.append(category)
        
        let indexPath = IndexPath(row: self.categories.count - 1, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
        
        presenter.getCategories()
    }
    
    func updateItem(updatedItem: Category)  {
        let index = self.categories.index(where: { $0.id == updatedItem.id })
        self.categories[index!] = updatedItem
        
        let indexPath = IndexPath(item: index!, section: 0)
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let category = self.categories[indexPath.row]
        
        if editingStyle == .delete {
            self.categories.remove(at: indexPath.row)
            self.presenter.deleteCategory(category: category)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    func deleteCategory(isSuccess: Bool) {
        print(isSuccess)
    }
    

}

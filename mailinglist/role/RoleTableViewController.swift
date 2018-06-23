import UIKit

class RoleTableViewController: UITableViewController, RoleViewContract {
  
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    lazy var presenter: RolePresenterContract = {
        return RolePresenter(view: self, getRoles: InjectionUseCase.provideGetRoles(), saveRole: InjectionUseCase.provideSaveRole(), deleteRole: InjectionUseCase.provideDeleteRole())
    }()
    
    var roles: [Role] = []
    var id: Int?
    var isEdited = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        label.text = "Please, wait..."
        presenter.getRoles()
    }
    
    func showError(error: [String]) {
        print(error)
    }
    
    func showRoles(roles: [Role]) {
            self.roles = roles
            self.tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
   
        cell.textLabel?.text = roles[indexPath.row].function
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let role = self.roles[indexPath.row]
        showAlertForm(with: role)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    @IBAction func addRole(_ sender: UIBarButtonItem) {
        showAlertForm(with: nil)
    }
    
    func showAlertForm(with role: Role?) {
        let title = role == nil ? "Add" : "Edit"
        let alert = UIAlertController(title: title + " Role", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.clearButtonMode = .whileEditing
            textField.autocapitalizationType = .sentences
            textField.placeholder = "Role"
            textField.returnKeyType = .done
            if let id = role?.id {
                textField.text = role?.function!
                self.id = id
            }
        }
        
        alert.addAction(UIAlertAction(title: title, style: .default, handler: { (action) in
            let function = alert.textFields?.first?.text
            self.saveRole(function: function!)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.view.tintColor = UIColor(named: "second")
        present(alert, animated: true, completion: nil)
    }
    
    private func saveRole(function: String) {
        var role = Role(function: function)
        
        if let id = self.id {
            self.id = id
            self.isEdited = true
            role = Role(id: id, function: function)
            self.id = nil
        }
        
        self.presenter.saveRole(role: role)
    }
    
    func showRole(role: Role) {
        if self.isEdited {
            updateItem(updatedItem: role)
            self.isEdited = false
            return
        }
        
        self.roles.append(role)
    
        let indexPath = IndexPath(row: self.roles.count - 1, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
    
    func updateItem(updatedItem: Role)  {
         let index = self.roles.index(where: { $0.id == updatedItem.id })
         self.roles[index!] = updatedItem
        
        let indexPath = IndexPath(item: index!, section: 0)
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
         let role = self.roles[indexPath.row]
        
        if editingStyle == .delete {
            self.roles.remove(at: indexPath.row)
            self.presenter.deleteRole(role: role)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    func deleteRole(isSuccess: Bool) {
        print(isSuccess)
    }
 



}

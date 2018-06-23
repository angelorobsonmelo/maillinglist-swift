import UIKit

class RoleTableViewController: UITableViewController, RoleViewContract {

    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    lazy var presenter: RolePresenterContract = {
        return RolePresenter(view: self, getRoles: InjectionUseCase.provideGetRoles(), saveRole: InjectionUseCase.provideSaveRole())
    }()
    
    var roles: [Role] = []
    
    var id: Int?

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
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
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
            role = Role(id: id, function: function)
            self.id = nil
        }
        
        self.presenter.saveRole(role: role)
    }
    
    func showRole(role: Role) {
        print(role)
    }
    
 
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
 



}

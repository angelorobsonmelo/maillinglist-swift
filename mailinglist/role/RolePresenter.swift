import Foundation

class RolePresenter: RolePresenterContract {
 
    let view: RoleViewContract
    let getRolesUseCase: GetRoles
    let saveRole: SaveRole
    
    init(view: RoleViewContract, getRoles: GetRoles, saveRole: SaveRole) {
        self.view = view
        self.getRolesUseCase = getRoles
        self.saveRole = saveRole
    }
    
    func getRoles() {
        getRolesUseCase.getRoles(onSuccess: { (response) in
            self.view.showRoles(roles: response as! [Role])
        }, onEmpty: {
            
        }) { (error) in
            self.view.showError(error: error)
        }
    }
    
    func saveRole(role: Role) {
        saveRole.saveRole(role: role, onSuccess: { (response) in
            self.view.showRole(role: response!)
        }, onEmpty: {
            
        }) { (error) in
            self.view.showError(error: error)
        }
    }
    
    
}

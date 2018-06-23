import Foundation

class RolePresenter: RolePresenterContract {
 
    let view: RoleViewContract
    let getRolesUseCase: GetRoles
    let saveRole: SaveRole
    let deleteRole: DeleteRole
    
    init(view: RoleViewContract, getRoles: GetRoles, saveRole: SaveRole, deleteRole: DeleteRole) {
        self.view = view
        self.getRolesUseCase = getRoles
        self.saveRole = saveRole
        self.deleteRole = deleteRole
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
    
    func deleteRole(role: Role) {
        deleteRole.delete(role: role, onSuccess: { (response) in
            self.deleteRole.delete(role: role, onSuccess: { (response) in
                if let isSuccess = response {
                    self.view.deleteRole(isSuccess: isSuccess)
                }
            }, onError: { (error) in
                self.view.showError(error: error)
            })
        }) { (error) in
            
        }
    }
    
    
}

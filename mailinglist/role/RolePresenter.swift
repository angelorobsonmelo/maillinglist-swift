import Foundation

class RolePresenter: RolePresenterContract {

    let view: RoleViewContract
    let getRolesUseCase: GetRoles
    
    init(view: RoleViewContract, getRoles: GetRoles) {
        self.view = view
        self.getRolesUseCase = getRoles
    }
    
    func getRoles() {
        getRolesUseCase.getRoles(onSuccess: { (response) in
            self.view.showRoles(roles: response as! [Role])
        }, onEmpty: {
            
        }) { (error) in
            self.view.showError(error: error)
        }
    }
    
    
}

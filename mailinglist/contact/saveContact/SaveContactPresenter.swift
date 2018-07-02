import Foundation

class SaveContactPresenter: SaveContactPresenterContract {
  
   private let view: SaveContactViewContract
   private let getCategoriesUseCase: GetCategories
   private let getRolesUseCase: GetRoles
    
    init(view: SaveContactViewContract, getCategoriesUseCase: GetCategories, getRolesUseCase: GetRoles) {
        self.view = view
        self.getCategoriesUseCase = getCategoriesUseCase
        self.getRolesUseCase = getRolesUseCase
    }
    
    func getCategories() {
        getCategoriesUseCase.getCategories(onSuccess: { (cetegories) in
            self.view.showCategories(categories: cetegories as! [Category])
        }, onEmpty: {
            
        }) { (error) in
            self.view.showError(error: error)
        }
    }
    
    func getRoles() {
        getRolesUseCase.getRoles(onSuccess: { (roles) in
            self.view.showRoles(roles: roles as! [Role])
        }, onEmpty: {
            
        }) { (error) in
            self.view.showError(error: error)
        }
    }
    
}

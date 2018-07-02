import Foundation

class SaveContactPresenter: SaveContactPresenterContract {

   private let view: SaveContactViewContract
   private let getCategoriesUseCase: GetCategories
   private let getRolesUseCase: GetRoles
   private let saveContactUseCase: SaveContact
    
   init(view: SaveContactViewContract, getCategoriesUseCase: GetCategories, getRolesUseCase: GetRoles, saveContactUseCase: SaveContact) {
        self.view = view
        self.getCategoriesUseCase = getCategoriesUseCase
        self.getRolesUseCase = getRolesUseCase
        self.saveContactUseCase = saveContactUseCase
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
    
    func saveContact(contact: Contact) {
        saveContactUseCase.saveContact(contact: contact, onSuccess: { (contact) in
            self.view.showContact(contact: contact)
        }, onEmpty: {
            
        }) { (error) in
            self.view.showError(error: error)
        }
    }
    
}

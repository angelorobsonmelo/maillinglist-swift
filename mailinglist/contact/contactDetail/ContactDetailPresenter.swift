import Foundation

class ContactDetailPresenter: ContactDetailPresenterContract {
    
    private let view: ContactDetailViewContract
    private let getContactUseCase: GetContact
    
    init(view: ContactDetailViewContract, getContactUseCase: GetContact) {
        self.view = view
        self.getContactUseCase = getContactUseCase
    }
    
    func getContact(id: Int) {
        getContactUseCase.getContact(id: id, onSuccess: { (contact) in
            self.view.showContact(contact: contact!)
        }, onEmpty: {
            
        }) { (error) in
            self.view.showError(error: error)
        }
    }
    
    
}

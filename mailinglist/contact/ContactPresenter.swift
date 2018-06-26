import Foundation

class ContactPresenter: ContactPresenterContract {
    
    let view: ContactViewContract
    let getContactsUseCase: getContacts

    init(view: ContactViewContract, getContacts: getContacts) {
        self.view = view
        self.getContactsUseCase = getContacts
    }
    
    func getContacts() {
        getContactsUseCase.getContacts(onSuccess: { (contacts) in
            self.view.showContracts(contracts: contacts)
        }, onEmpty: {
            
        }) { (error) in
            self.view.showError(error: error)
        }
    }
    
    func saveContact(contact: Contact) {
        
    }
    
    func deleteContact(contact: Contact) {
        
    }
    
    
    
}

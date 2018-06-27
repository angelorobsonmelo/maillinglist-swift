import Foundation

class ContactPresenter: ContactPresenterContract {
    
    let view: ContactViewContract
    let getContactsUseCase: getContacts

    init(view: ContactViewContract, getContacts: getContacts) {
        self.view = view
        self.getContactsUseCase = getContacts
    }
    
    func getContacts(contactFilter: ContactFilter, page: Int = 0, perPage: Int = 25) {
        getContactsUseCase.getContacts(contactFilter: contactFilter, page: page, perPage: perPage, onSuccess: { (contacts) in
            self.view.showContacts(contacts: contacts)
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

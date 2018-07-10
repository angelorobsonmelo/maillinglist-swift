import Foundation

class ContactPresenter: ContactPresenterContract {
        
    let view: ContactViewContract
    let getContactsUseCase: getContacts
    let deleteContactUseCase: DeleteContact
    
    init(view: ContactViewContract, getContacts: getContacts, deleteContact: DeleteContact) {
        self.view = view
        self.getContactsUseCase = getContacts
        self.deleteContactUseCase = deleteContact
    }
    
    func getContacts(contactFilter: ContactFilter, page: Int = 0, perPage: Int = 25) {
        getContactsUseCase.getContacts(contactFilter: contactFilter, page: page, perPage: perPage, onSuccess: { (contacts) in
            self.view.showContacts(contacts: contacts)
        }, onEmpty: {
            
        }) { (error) in
            self.view.showError(error: error)
        }
    }
    
    func deleteContact(contact: Contact) {
        self.deleteContactUseCase.delete(contact: contact, onSuccess: { (result) in
            self.view.deleteContract(isSuccess: result!)
        }) { (error) in
            self.view.showError(error: error)
        }
    }
    
    
    
}


import Foundation

class SaveContact {
    
    private let contactRemoteRepository: ContactRemoteRepository
    
    init(contactRemoteRepository: ContactRemoteRepository) {
        self.contactRemoteRepository = contactRemoteRepository
    }
    
    func saveContact(contact: Contact, onSuccess: @escaping (Contact) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void ){
        let contactSave = converterContactToContactSave(contact: contact)
        
        contactRemoteRepository.saveContact(contactSave: contactSave , onSuccess: { (contact) in
            onSuccess(contact)
        }, onEmpty: {
            onEmpty()
        }) { (error) in
            onError(error)
        }
        
    }
    
    private func converterContactToContactSave(contact: Contact) -> ContactSave {
        let rolesIds = contact.roles?.map({ (role) -> Int in
            role.id!
        })
        
        var contactSave = ContactSave(userNameInstagram: contact.userNameInstagram!, categoryId: (contact.category?.id)!, functionsIds: rolesIds!, gender: contact.gender!, registrationDate: Date(), userAppId: 1)
        
        if ((contact.id) != nil) {
            contactSave = ContactSave(id: contact.id!, userNameInstagram: contact.userNameInstagram!, categoryId: (contact.category?.id)!, functionsIds: rolesIds!, gender: contact.gender!, registrationDate: Date(), userAppId: 1)
        }
        
        return contactSave
    }
}

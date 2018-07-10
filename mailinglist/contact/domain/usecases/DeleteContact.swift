
import Foundation

class DeleteContact {
    
    private let contactRemoteRepository: ContactRemoteRepository
    
    init(contactRemoteRepository: ContactRemoteRepository) {
        self.contactRemoteRepository = contactRemoteRepository
    }
    
    func delete(contact: Contact, onSuccess: @escaping (Bool?) -> Void, onError: @escaping ([String]) -> Void) {
        self.contactRemoteRepository.delete(contact: contact, onSuccess: { (response) in
            onSuccess(response)
        }) { (error) in
            onError(error)
        }
    }

}

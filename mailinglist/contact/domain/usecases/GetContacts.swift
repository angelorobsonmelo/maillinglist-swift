import Foundation

class getContacts {
    
    private let contactRemoteRepository: ContactRemoteRepository
    
    init(contactRemoteRepository: ContactRemoteRepository) {
        self.contactRemoteRepository = contactRemoteRepository
    }
    
    func getContacts(contactFilter: ContactFilter, onSuccess: @escaping ([Contact?]) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        self.contactRemoteRepository.getContacts(contactFilter: contactFilter, onSuccess: { (contacts) in
            onSuccess(contacts)
        }, onEmpty: {
            onEmpty()
        }) { (error) in
            onError(error)
        }
    }
}


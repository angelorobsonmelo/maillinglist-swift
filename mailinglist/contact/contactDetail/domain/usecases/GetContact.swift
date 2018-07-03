import Foundation

class GetContact {
    
    private let contactRemoteRepository: ContactRemoteRepository
    
    init(contactRemoteRepository: ContactRemoteRepository) {
        self.contactRemoteRepository = contactRemoteRepository
    }
    
    func getContact(id: Int, onSuccess: @escaping (Contact?) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        self.contactRemoteRepository.getContact(id: id, onSuccess: { (contact) in
            onSuccess(contact)
        }, onEmpty: {
            onEmpty()
        }) { (error) in
            onError(error)
        }
    }
}

import Foundation

class getContacts {
    
    private let contactRemoteRepository: ContactRemoteRepository
    
    init(contactRemoteRepository: ContactRemoteRepository) {
        self.contactRemoteRepository = contactRemoteRepository
    }
    
    func getContacts(contactFilter: ContactFilter, page: Int, perPage: Int, onSuccess: @escaping (ResponseBase<ContentObjects<Contact>>) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        self.contactRemoteRepository.getContacts(contactFilter: contactFilter, page: page, perPage: perPage, onSuccess: { (response) in
            onSuccess(response)
        }, onEmpty: {
            onEmpty()
        }) { (error) in
            onError(error)
        }
    }
}


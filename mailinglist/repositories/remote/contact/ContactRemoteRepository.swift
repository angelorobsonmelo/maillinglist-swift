
import Foundation

public protocol ContactRemoteRepository {
    
    func getContacts(contactFilter: ContactFilter, page: Int, perPage: Int, onSuccess: @escaping ([Contact]) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void)
    
    func saveContact(contactSave: ContactSave, onSuccess: @escaping (Contact) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void)
    
}


import Foundation

public protocol ContactRemoteRepository {
    
    func getContacts(contactFilter: ContactFilter, page: Int, perPage: Int, onSuccess: @escaping (ContactResponse) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void)
    
    func getContact(id: Int, onSuccess: @escaping (Contact) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void)
    
    func saveContact(contactSave: ContactSave, onSuccess: @escaping (Contact) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void)
    
    func delete(contact: Contact, onSuccess: @escaping (Bool?) -> Void, onError: @escaping ([String]) -> Void)
    
}

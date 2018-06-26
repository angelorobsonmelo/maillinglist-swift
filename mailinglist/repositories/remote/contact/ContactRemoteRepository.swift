
import Foundation

public protocol ContactRemoteRepository {
    
    func getContacts(contactFilter: ContactFilter, onSuccess: @escaping ([Contact]) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void)
    
}

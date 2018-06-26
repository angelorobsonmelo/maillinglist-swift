
import Foundation

public protocol ContactRemoteRepository {
    
    func getContacts(onSuccess: @escaping ([Contact]) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void)
    
}

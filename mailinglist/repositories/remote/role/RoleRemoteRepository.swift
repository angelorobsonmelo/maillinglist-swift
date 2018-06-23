
import Foundation

public protocol RoleRemoteRepository {
    
    func getRoles(onSuccess: @escaping ([Role?]) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void)
    
    func save(role: Role, onSuccess: @escaping (Role?) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void)
}

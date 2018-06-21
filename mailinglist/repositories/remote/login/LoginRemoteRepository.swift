import Foundation

public protocol LoginRemoteRepository {
    
    func auth(with auth: Auth, onComplete: @escaping (AnyObject) -> Void, onError: @escaping (AnyObject) -> Void)    
}

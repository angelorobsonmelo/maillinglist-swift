import Foundation

public protocol LoginRemoteRespository {
    
    func auth(with auth: Auth, onComplete: @escaping (AnyObject) -> Void, onError: @escaping (AnyObject) -> Void)    
}

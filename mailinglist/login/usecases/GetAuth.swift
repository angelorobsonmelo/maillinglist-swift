
import Foundation

class GetAuth {
    
    func auth(with auth: Auth, onComplete: @escaping (AnyObject) -> Void, onError: @escaping (AnyObject) -> Void) {
        LoginRemoteRespository.auth(with: auth, onComplete: { (response) in
            onComplete(response)
        })
        { (error) in
            onError(error)
        }
    }
}

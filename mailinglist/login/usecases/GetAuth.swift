
import Foundation

class GetAuth {
    
    private let loginRemoteRepository: LoginRemoteRepository
    
    init(loginRemoteRepository: LoginRemoteRepository) {
        self.loginRemoteRepository = loginRemoteRepository
    }
    
    func auth(with auth: Auth, onComplete: @escaping (AnyObject) -> Void, onError: @escaping (AnyObject) -> Void) {
        self.loginRemoteRepository.auth(with: auth, onComplete: { (response) in
            onComplete(response)
        })
        { (error) in
            onError(error)
        }
    }
}


import Foundation

class GetAuth {
    
    private let loginRemoteRepository: LoginRemoteRespository
    
    init(loginRemoteRepository: LoginRemoteRespository) {
        self.loginRemoteRepository = loginRemoteRepository
    }
    
    func auth(with auth: Auth, onComplete: @escaping (AnyObject) -> Void, onError: @escaping (AnyObject) -> Void) {
        loginRemoteRepository.auth(with: auth, onComplete: { (response) in
            onComplete(response)
        })
        { (error) in
            onError(error)
        }
    }
}


import Foundation

class InjectionUseCase {
    
    private static let loginRemoteRepository = InjectionRepository.provideLoginRemoteRespository()
    
    class func provideGetAuth() -> GetAuth {
        return GetAuth(loginRemoteRepository: loginRemoteRepository)
    }
}


import Foundation

class InjectionUseCase {
    
    private static let loginRemoteRepository = InjectionRemoteRepository.provideLoginRemoteRespository()
    private static let UserLocalRepository = InjectionLocalRepository.provideUserLocalRespository()
    
    class func provideGetAuth() -> GetAuth {
        return GetAuth(loginRemoteRepository: loginRemoteRepository)
    }
    
    class func provideSaveUser() -> SaveUser {
       return SaveUser(userLocalRepository: UserLocalRepository)
    }
    
    class func provideGetUser() -> GetUser {
        return GetUser(userLocalRepository: UserLocalRepository)
    }
}


import Foundation

class InjectionUseCase {
    
    private static let loginRemoteRepository = InjectionRemoteRepository.provideLoginRemoteRepository()
    private static let userLocalRepository = InjectionLocalRepository.provideUserLocalRespository()
    private static let roleRemoteRepository = InjectionRemoteRepository.provideRoleRemoteRepository()
    
    class func provideGetAuth() -> GetAuth {
        return GetAuth(loginRemoteRepository: loginRemoteRepository)
    }
    
    class func provideSaveUser() -> SaveUser {
       return SaveUser(userLocalRepository: userLocalRepository)
    }
    
    class func provideGetUser() -> GetUser {
        return GetUser(userLocalRepository: userLocalRepository)
    }
    
    class func provideGetRoles() -> GetRoles {
        return GetRoles(roleRemoteRepository: roleRemoteRepository)
    }
    
    class func provideSaveRole() -> SaveRole {
        return SaveRole(roleRemoteRepository: roleRemoteRepository)
    }
}

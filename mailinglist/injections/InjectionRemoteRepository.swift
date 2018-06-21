
import Foundation

class InjectionRemoteRepository {
    
    class func provideLoginRemoteRepository() -> LoginRemoteRepository {
        return LoginRemoteRepositoryImpl.getInstance()
   }
    
    class func provideRoleRemoteRepository() -> RoleRemoteRepository {
        return RoleRemoteRepositoryImpl.getInstance()
    }

}

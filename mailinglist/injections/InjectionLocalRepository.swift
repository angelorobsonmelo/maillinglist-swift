
import Foundation

class InjectionLocalRepository {
    
    class func provideUserLocalRespository() -> UserLocalRepository {
        return UserLocalRepositoryImpl.getInstance()
    }
    
}

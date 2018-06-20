
import Foundation

class InjectionRemoteRepository {
    
    class func provideLoginRemoteRespository() -> LoginRemoteRespository {
        return LoginRemoteRespositoryImpl.getInstance()
}

}

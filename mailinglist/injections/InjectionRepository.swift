
import Foundation

class InjectionRepository{
    
    class func provideLoginRemoteRespository() -> LoginRemoteRespository {
        return LoginRemoteRespositoryImpl.getInstance()
}

}

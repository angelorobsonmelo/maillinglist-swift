
import Foundation

class InjectionRepository{
    
    class func provideLoginRemoteRespository() -> LoginRemoteRespository {
        return LoginRemoteRespository.getInstance()
}

}

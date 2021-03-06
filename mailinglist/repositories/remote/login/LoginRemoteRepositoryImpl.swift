import Foundation
import Alamofire

public class LoginRemoteRepositoryImpl: LoginRemoteRepository {

    private let jsonEncoder = JSONEncoder()
    
    private static var INSTANCE: LoginRemoteRepository?
    
    public static func getInstance() -> LoginRemoteRepository {
        if INSTANCE == nil {
            INSTANCE = LoginRemoteRepositoryImpl()
        }
        
        return INSTANCE!
    }
    
    public func auth(with auth: Auth, onComplete: @escaping (AnyObject) -> Void, onError: @escaping (AnyObject) -> Void) {
        let request = Utils.getRequest(object: auth, url: "auth", method: HTTPMethod.post.rawValue)
        
        Alamofire.request(request).responseJSON { response in
            switch response.result {
                            case .success:
                                if let value = response.result.value {
                                        onComplete(value as AnyObject)
                                    }
                                case .failure(let error):
                                    onError(error as AnyObject)
                                }
            }
        
  }
    
}

import Foundation
import Alamofire

public class LoginRemoteRespositoryImpl: LoginRemoteRespository {

    private let jsonEncoder = JSONEncoder()
    
    private static var INSTANCE: LoginRemoteRespository?
    
    public static func getInstance() -> LoginRemoteRespository {
        if INSTANCE == nil {
            INSTANCE = LoginRemoteRespositoryImpl()
        }
        
        return INSTANCE!
    }
    
    public func auth(with auth: Auth, onComplete: @escaping (AnyObject) -> Void, onError: @escaping (AnyObject) -> Void) {
        let urlRequest = Constants.baseUrl + "/auth"
        let jsonData = try! jsonEncoder.encode(auth)
        var request = URLRequest(url: URL(string: urlRequest)!)
        
        request.httpMethod = "POST"
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
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

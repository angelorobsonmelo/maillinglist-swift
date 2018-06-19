import Foundation
import Alamofire

class LoginRemoteRespository {
    
    private static var INSTANCE: LoginRemoteRespository?
    
    public static func getInstance() -> LoginRemoteRespository {
        if INSTANCE == nil {
            INSTANCE = LoginRemoteRespository()
        }
        
        return INSTANCE!
    }
    
     func auth(with auth: Auth, onComplete: @escaping (AnyObject) -> Void, onError: @escaping (AnyObject) -> Void) {
        let url = Constants.baseUrl + "/auth"
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(auth)
        var request = URLRequest(url: URL(string: url)!)
        
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

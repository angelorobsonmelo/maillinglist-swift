import Foundation
import Alamofire

class LoginRemoteRespository {
    
    class func auth(with auth: Auth, onComplete: @escaping (String) -> Void) {
        let url = Constants.baseUrl + "/auth"
        Alamofire.request(url, method: .post, parameters: auth, encoding: JSONEncoding.default)

   }

}

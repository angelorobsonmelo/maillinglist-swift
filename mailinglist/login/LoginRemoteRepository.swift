import Foundation
import Alamofire

class LoginRemoteRespository {
    
    class func auth(with auth: Auth, onComplete: @escaping (String) -> Void) {
        let url = Constants.baseUrl + "/auth"
        let headers : HTTPHeaders = ["Content-Type":"application/json"]
        let params : Parameters = ["grant_type":"password","username":"mail","password":"pass"]

        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
        
   }

}

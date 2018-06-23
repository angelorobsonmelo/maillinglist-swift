import Foundation
import Alamofire
import SwiftKeychainWrapper
import ObjectMapper
import AlamofireObjectMapper

struct Utils {
    
    public static func getHeadersWithJwtToken() -> HTTPHeaders {
        let token = KeychainWrapper.standard.string(forKey: "token")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token!)",
            "Accept": "application/json"
        ]
        
        return headers
    }
    
    public static func getRequest<T: Codable>(object: T, url: String, method: String) ->  URLRequest {
        let token = KeychainWrapper.standard.string(forKey: "token")
        let jsonEncoder = JSONEncoder()
        let urlRequest = Constants.baseUrl + "/\(url)"
        let jsonData = try! jsonEncoder.encode(object)
        var request = URLRequest(url: URL(string: urlRequest)!)
        
        request.httpMethod = method
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        request.httpBody = jsonData
        
        return request
    }
    
}





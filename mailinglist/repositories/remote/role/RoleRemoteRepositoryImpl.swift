import Foundation
import Alamofire
import SwiftKeychainWrapper
import ObjectMapper
import AlamofireObjectMapper


public class RoleRemoteRepositoryImpl: RoleRemoteRepository {
   
    private let jsonEncoder = JSONEncoder()
    private let roleUrl = "\(Constants.baseUrl)/functions"

    private static var INSTANCE: RoleRemoteRepository?
    
    public static func getInstance() -> RoleRemoteRepository {
        if INSTANCE == nil {
            INSTANCE = RoleRemoteRepositoryImpl()
        }
        
        return INSTANCE!
    }
    
    public func getRoles(onSuccess: @escaping ([Role?]) -> Void, onEmpty: @escaping () -> Void, onError: @escaping (String) -> Void) {
        let token = KeychainWrapper.standard.string(forKey: "token")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token!)",
            "Accept": "application/json"
        ]
        
        Alamofire.request(roleUrl, headers: headers).responseObject { (response: DataResponse<RolesResponse>) in
            switch response.result {
            case .success:
                if let roleResponse = response.result.value?.data?.content {
                    if roleResponse.isEmpty {
                        onEmpty()
                        return
                    }
                    
                    onSuccess(roleResponse)
                }
            case .failure(let error):
                onError(error as! String)
            }

        }
        
    }
}

class Result<T: Mappable>: Mappable {
    var result: T?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        result <- map["result"]
    }
}


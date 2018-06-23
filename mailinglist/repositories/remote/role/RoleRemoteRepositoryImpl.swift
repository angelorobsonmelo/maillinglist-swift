import Foundation
import Alamofire
import SwiftKeychainWrapper
import ObjectMapper
import AlamofireObjectMapper


public class RoleRemoteRepositoryImpl: RoleRemoteRepository {
 
    private let jsonEncoder = JSONEncoder()
    private let roleUrl = "\(Constants.baseUrl)/functions"
    let headers = Utils.getHeadersWithJwtToken()

    private static var INSTANCE: RoleRemoteRepository?
    
    public static func getInstance() -> RoleRemoteRepository {
        if INSTANCE == nil {
            INSTANCE = RoleRemoteRepositoryImpl()
        }
        
        return INSTANCE!
    }
    
    public func getRoles(onSuccess: @escaping ([Role?]) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        
        Alamofire.request(self.roleUrl, headers: self.headers).responseObject { (response: DataResponse<ResponseBase<DataRoles>>) in
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
                onError(response.result.value?.errors ?? [error.localizedDescription])
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


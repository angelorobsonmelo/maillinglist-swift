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
    
    public func save(role: Role, onSuccess: @escaping (Role?) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        var url = "functions"
        var request = Utils.getRequest(object: role, url: url, method: HTTPMethod.post.rawValue)

        if let id = role.id {
             url += "/\(id)"
             request = Utils.getRequest(object: role, url: url, method: HTTPMethod.put.rawValue)
        }
        
        Alamofire.request(request).responseObject { (response: DataResponse<ResponseBase<Role>>) in
            switch response.result {
            case .success:
                if let roleResponse = response.result.value?.data {
                    if roleResponse.id == nil {
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
    
    public func delete(role: Role, onSuccess: @escaping (Bool?) -> Void, onError: @escaping ([String]) -> Void) {
        let url = "functions/\(role.id!)"
        let request = Utils.getRequest(object: role, url: url, method: HTTPMethod.delete.rawValue)

        Alamofire.request(request).responseObject { (response: DataResponse<ResponseBase<Role>>) in
            switch response.result {
            case .success:
                onSuccess(true)
            case .failure(let error):
                onError(response.result.value?.errors ?? [error.localizedDescription])
            }
            
        }
    }
    
    
}



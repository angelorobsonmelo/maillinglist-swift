import Foundation
import Alamofire
import SwiftKeychainWrapper

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
        
        Alamofire.request(roleUrl, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                    do {
                        if let data = response.data {
                        let role = try JSONDecoder().decode(Role.self, from: data)
                        
                        onSuccess([role] as [Role])
                        }
                            } catch {
                                 print(error.localizedDescription)
                                 onError(error.localizedDescription)
                                    }
                
            case .failure(let error):
                onError(error.localizedDescription)
            }
        }
        
    }
}

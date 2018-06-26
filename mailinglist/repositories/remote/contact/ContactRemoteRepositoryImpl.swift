import Foundation
import Alamofire
import SwiftKeychainWrapper
import ObjectMapper
import AlamofireObjectMapper

public class ContactRemoteRepositoryImpl: ContactRemoteRepository {
    
    private let jsonEncoder = JSONEncoder()
    private let contactUrl = "\(Constants.baseUrl)/contacts/filter?pag=0&perPage=25"
    let headers = Utils.getHeadersWithJwtToken()
    
    private static var INSTANCE: ContactRemoteRepository?
    
    public static func getInstance() -> ContactRemoteRepository {
        if INSTANCE == nil {
            INSTANCE = ContactRemoteRepositoryImpl()
        }
        
        return INSTANCE!
    }
    
    public func getContacts(contactFilter: ContactFilter, onSuccess: @escaping ([Contact]) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        let request = Utils.getRequest(object: contactFilter, url: contactUrl, method: HTTPMethod.post.rawValue)

        Alamofire.request(request).responseObject { (response: DataResponse<ResponseBase<ContentObjects<Contact>>>) in
            switch response.result {
            case .success:
                if let categoryResponse = response.result.value?.data?.content {
                    if categoryResponse.isEmpty {
                        onEmpty()
                        return
                    }
                    
                    onSuccess(categoryResponse)
                }
            case .failure(let error):
                onError(response.result.value?.errors ?? [error.localizedDescription])
            }
            
        }
        
    }
    
}

import Foundation
import Alamofire
import SwiftKeychainWrapper
import ObjectMapper
import AlamofireObjectMapper

public class ContactRemoteRepositoryImpl: ContactRemoteRepository {

    private let jsonEncoder = JSONEncoder()
    private var contactUrl = "\(Constants.baseUrl)/contacts"
//    let headers = Utils.getHeadersWithJwtToken()
    
    private static var INSTANCE: ContactRemoteRepository?
    
    public static func getInstance() -> ContactRemoteRepository {
        if INSTANCE == nil {
            INSTANCE = ContactRemoteRepositoryImpl()
        }
        
        return INSTANCE!
    }
    
    public func getContacts(contactFilter: ContactFilter, page: Int, perPage: Int, onSuccess: @escaping ([Contact]) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        let url = "contacts/filter?pag=\(page)&perPage=\(perPage)"
        let request = Utils.getRequest(object: contactFilter, url: url , method: HTTPMethod.post.rawValue)

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

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
                if let contactResponse = response.result.value?.data?.content {
                    if contactResponse.isEmpty {
                        onEmpty()
                        return
                    }
                    
                    onSuccess(contactResponse)
                }
            case .failure(let error):
                onError(response.result.value?.errors ?? [error.localizedDescription])
            }
            
        }
        
    }
    
    public func saveContact(contactSave: ContactSave, onSuccess: @escaping (Contact) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        let request = Utils.getRequest(object: contactSave, url: "contacts" , method: HTTPMethod.post.rawValue)

        Alamofire.request(request).responseObject { (response: DataResponse<ResponseBase<Contact>>) in
            switch response.result {
            case .success:
                if let contactResponse = response.result.value?.data {
                    if contactResponse.id == nil {
                        onEmpty()
                        return
                    }
                    
                    onSuccess(contactResponse)
                }
            case .failure(let error):
                onError(response.result.value?.errors ?? [error.localizedDescription])
            }
            
        }
        
    }
    
}

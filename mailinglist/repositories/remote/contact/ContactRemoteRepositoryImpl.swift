import Foundation
import Alamofire
import SwiftKeychainWrapper
import ObjectMapper
import AlamofireObjectMapper

public class ContactRemoteRepositoryImpl: ContactRemoteRepository {

    private let jsonEncoder = JSONEncoder()
    private var contactUrl = "\(Constants.baseUrl)/contacts"
    private let headers = Utils.getHeadersWithJwtToken()
    
    private static var INSTANCE: ContactRemoteRepository?
    
    public static func getInstance() -> ContactRemoteRepository {
        if INSTANCE == nil {
            INSTANCE = ContactRemoteRepositoryImpl()
        }
        
        return INSTANCE!
    }
    
    public func getContacts(contactFilter: ContactFilter, page: Int, perPage: Int, onSuccess: @escaping (ResponseBase<ContentObjects<Contact>>) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        let url = "contacts/filter?pag=\(page)&perPage=\(perPage)"
        let request = Utils.getRequest(object: contactFilter, url: url , method: HTTPMethod.post.rawValue)

        Alamofire.request(request).responseObject { (response: DataResponse<ResponseBase<ContentObjects<Contact>>>) in
            switch response.result {
            case .success:
                if let response = response.result.value {
                    if (response.data?.content?.isEmpty)! {
                        onEmpty()
                        return
                    }
                    
                    onSuccess(response)
                }
            case .failure(let error):
                onError(error as! [String])
            }
                    }
        
    }
    
    public func saveContact(contactSave: ContactSave, onSuccess: @escaping (Contact) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        var url = "contacts"
        var request = Utils.getRequest(object: contactSave, url: url, method: HTTPMethod.post.rawValue)
        
        if let id = contactSave.id {
            url += "/\(id)"
            request = Utils.getRequest(object: contactSave, url: url, method: HTTPMethod.put.rawValue)
        }

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
    
    public func getContact(id: Int, onSuccess: @escaping (Contact) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        let url = "\(self.contactUrl)/\(id)"
        Alamofire.request(url, headers: self.headers).responseObject { (response: DataResponse<ResponseBase<Contact>>) in
            switch response.result {
            case .success:
                if let conctactResponse = response.result.value?.data {
                    if conctactResponse.id == nil {
                        onEmpty()
                        return
                    }
                    
                    onSuccess(conctactResponse)
                }
            case .failure(let error):
                onError(response.result.value?.errors ?? [error.localizedDescription])
            }
            
        }
    }
    
    public func delete(contact: Contact, onSuccess: @escaping (Bool?) -> Void, onError: @escaping ([String]) -> Void) {
        let url = "contacts/\(contact.id!)"
        let request = Utils.getRequest(object: contact, url: url, method: HTTPMethod.delete.rawValue)
        
        Alamofire.request(request).responseObject { (response: DataResponse<ResponseBase<Contact>>) in
            switch response.result {
            case .success:
                onSuccess(true)
            case .failure(let error):
                onError(response.result.value?.errors ?? [error.localizedDescription])
            }
            
        }
    }
    
}

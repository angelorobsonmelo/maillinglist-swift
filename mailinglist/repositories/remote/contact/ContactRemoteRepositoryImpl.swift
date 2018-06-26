import Foundation
import Alamofire
import SwiftKeychainWrapper
import ObjectMapper
import AlamofireObjectMapper

public class ContactRemoteRepositoryImpl: ContactRemoteRepository {
    
    private let jsonEncoder = JSONEncoder()
    private let contactUrl = "\(Constants.baseUrl)/contacts"
    let headers = Utils.getHeadersWithJwtToken()
    
    private static var INSTANCE: ContactRemoteRepository?
    
    public static func getInstance() -> ContactRemoteRepository {
        if INSTANCE == nil {
            INSTANCE = ContactRemoteRepositoryImpl()
        }
        
        return INSTANCE!
    }
    
    public func getContacts(onSuccess: @escaping ([Contact]) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        Alamofire.request(self.contactUrl, headers: self.headers).responseObject { (response: DataResponse<ResponseBase<ContentObjects<Contact>>>) in
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
    
}

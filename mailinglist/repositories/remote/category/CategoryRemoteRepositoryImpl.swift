import Foundation
import Alamofire
import SwiftKeychainWrapper
import ObjectMapper
import AlamofireObjectMapper

public class CategoryRemoteRepositoryImpl: CategoryRemoteRepository {
 
    private let jsonEncoder = JSONEncoder()
    private let categoryUrl = "\(Constants.baseUrl)/categories"
    private let headers = Utils.getHeadersWithJwtToken()
    
    private static var INSTANCE: CategoryRemoteRepository?
    
    public static func getInstance() -> CategoryRemoteRepository {
        if INSTANCE == nil {
            INSTANCE = CategoryRemoteRepositoryImpl()
        }
        
        return INSTANCE!
    }
    
    public func getCategories(onSuccess: @escaping ([Category?]) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        Alamofire.request(self.categoryUrl, headers: self.headers).responseObject { (response: DataResponse<ResponseBase<ContentObjects<Category>>>) in
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
    
    public func save(category: Category, onSuccess: @escaping (Category?) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        var url = "categories"
        var request = Utils.getRequest(object: category, url: url, method: HTTPMethod.post.rawValue)
        
        if let id = category.id {
            url += "/\(id)"
            request = Utils.getRequest(object: category, url: url, method: HTTPMethod.put.rawValue)
        }
        
        Alamofire.request(request).responseObject { (response: DataResponse<ResponseBase<Category>>) in
            switch response.result {
            case .success:
                if let categoryResponse = response.result.value?.data {
                    if categoryResponse.id == nil {
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
    
    public func delete(category: Category, onSuccess: @escaping (Bool?) -> Void, onError: @escaping ([String]) -> Void) {
        let url = "categories/\(category.id!)"
        let request = Utils.getRequest(object: category, url: url, method: HTTPMethod.delete.rawValue)
        
        Alamofire.request(request).responseObject { (response: DataResponse<ResponseBase<Category>>) in
            switch response.result {
            case .success:
                onSuccess(true)
            case .failure(let error):
                onError(response.result.value?.errors ?? [error.localizedDescription])
            }
            
        }
    }
    
    
}



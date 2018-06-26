
import Foundation

public protocol CategoryRemoteRepository {
    
    func getCategories(onSuccess: @escaping ([Category?]) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void)
    
    func save(category: Category, onSuccess: @escaping (Category?) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void)
    
    func delete(category: Category, onSuccess: @escaping (Bool?) -> Void, onError: @escaping ([String]) -> Void)
}

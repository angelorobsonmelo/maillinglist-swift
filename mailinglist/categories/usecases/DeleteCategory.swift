import Foundation

class DeleteCategory {
    
    private let categoryRemoteRepository: CategoryRemoteRepository
    
    init(categoryRemoteRepository: CategoryRemoteRepository) {
        self.categoryRemoteRepository = categoryRemoteRepository
    }
    
    func delete(category: Category, onSuccess: @escaping (Bool?) -> Void, onError: @escaping ([String]) -> Void) {
        self.categoryRemoteRepository.delete(category: category, onSuccess: { (response) in
            onSuccess(response)
        }) { (error) in
            onError(error)
        }
    }
    
}

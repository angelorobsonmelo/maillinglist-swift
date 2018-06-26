
import Foundation

class GetCategories {
    
    private let categoryRemoteRepository: CategoryRemoteRepository
    
    init(categoryRemoteRepository: CategoryRemoteRepository) {
        self.categoryRemoteRepository = categoryRemoteRepository
    }
    
    func getCategories(onSuccess: @escaping ([Category?]) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        self.categoryRemoteRepository.getCategories(onSuccess: { (response) in
            onSuccess(response)
        }, onEmpty: {
            onEmpty()
        }) { (error) in
            onError(error)
        }
    }
    
}

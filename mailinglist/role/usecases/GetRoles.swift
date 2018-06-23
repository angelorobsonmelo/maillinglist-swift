
import Foundation

class GetRoles {
    
    private let roleRemoteRepository: RoleRemoteRepository
    
    init(roleRemoteRepository: RoleRemoteRepository) {
        self.roleRemoteRepository = roleRemoteRepository
    }
    
    func getRoles(onSuccess: @escaping ([Role?]) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        self.roleRemoteRepository.getRoles(onSuccess: { (response) in
            onSuccess(response)
        }, onEmpty: {
            onEmpty()
        }) { (error) in
            onError(error)
        }
    }
    
}

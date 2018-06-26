
import Foundation

class SaveRole {
    
    private let roleRemoteRepository: RoleRemoteRepository
    
    init(roleRemoteRepository: RoleRemoteRepository) {
        self.roleRemoteRepository = roleRemoteRepository
    }
    
    func saveRole(role: Role, onSuccess: @escaping (Role?) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        self.roleRemoteRepository.save(role: role
            , onSuccess: { (response) in
                onSuccess(response)
        }, onEmpty: {
            
        }) { (error) in
            onError(error)
        }
    }
    
}

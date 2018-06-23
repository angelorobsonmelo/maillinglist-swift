
import Foundation

class SaveRole {
    
    private let roleRemoteRepository: RoleRemoteRepository
    
    init(roleRemoteRepository: RoleRemoteRepository) {
        self.roleRemoteRepository = roleRemoteRepository
    }
    
    func saveRole(onSuccess: @escaping (Role?) -> Void, onEmpty: @escaping () -> Void, onError: @escaping (String) -> Void) {
      
    }
    
}

import Foundation

class DeleteRole {
    
    private let roleRemoteRepository: RoleRemoteRepository
    
    init(roleRemoteRepository: RoleRemoteRepository) {
        self.roleRemoteRepository = roleRemoteRepository
    }
    
    func delete(role: Role, onSuccess: @escaping (Bool?) -> Void, onError: @escaping ([String]) -> Void) {
        self.roleRemoteRepository.delete(role: role, onSuccess: { (response) in
            onSuccess(response)
        }) { (error) in
            onError(error)
        }
    }
    
}

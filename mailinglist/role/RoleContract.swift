import Foundation

protocol RoleViewContract {
    func showError(error: [String]) -> Void
    func showRoles(roles: [Role]) -> Void
    func showRole(role: Role) -> Void
    func deleteRole(isSuccess: Bool)
}

protocol RolePresenterContract {
    func getRoles()
    func saveRole(role: Role)
    func deleteRole(role: Role)
}

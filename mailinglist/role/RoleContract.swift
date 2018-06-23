import Foundation

protocol RoleViewContract {
    func showError(error: [String]) -> Void
    func showRoles(roles: [Role]) -> Void
    func showRole(role: Role) -> Void
}

protocol RolePresenterContract {
    func getRoles()
    func saveRole(role: Role)
}

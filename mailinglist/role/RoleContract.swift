import Foundation

protocol RoleViewContract {
    func showError(error: [String]) -> Void
    func showRoles(roles: [Role]) -> Void
}

protocol RolePresenterContract {
    func getRoles()
}

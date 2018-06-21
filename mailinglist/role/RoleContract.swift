import Foundation

protocol RoleViewContract {
    func showError(error: AnyObject) -> Void
    func showRoles(roles: [Role]) -> Void
}

protocol RolePresenterContract {
    func getRoles()
}

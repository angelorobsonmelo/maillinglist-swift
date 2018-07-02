import Foundation

protocol SaveContactViewContract {
    func showError(error: [String]) -> Void
    func showCategories(categories: [Category]) -> Void
    func showRoles(roles: [Role]) -> Void

}

protocol SaveContactPresenterContract {
    func getCategories()
    func getRoles()
}


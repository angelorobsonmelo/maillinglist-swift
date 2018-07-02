import Foundation

protocol SaveContactViewContract {
    func showError(error: [String]) -> Void
    func showCategories(categories: [Category]) -> Void
    func showRoles(roles: [Role]) -> Void
    func showContact(contact: Contact) -> Void
}

protocol SaveContactPresenterContract {
    func getCategories()
    func getRoles()
    func saveContact(contact: Contact)
}


import Foundation

protocol ContactDetailViewContract {
    func showError(error: [String]) -> Void
    func showContact(contact: Contact) -> Void
}

protocol ContactDetailPresenterContract {
    func getContact(id: Int)
}

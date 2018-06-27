import Foundation

protocol ContactViewContract {
    func showError(error: [String]) -> Void
    func showContacts(contacts: [Contact?]) -> Void
    func showContact(contact: Contact) -> Void
    func deleteContract(isSuccess: Bool)
}

protocol ContactPresenterContract {
    func getContacts(contactFilter: ContactFilter, page: Int, perPage: Int)
    func saveContact(contact: Contact)
    func deleteContact(contact: Contact)
}

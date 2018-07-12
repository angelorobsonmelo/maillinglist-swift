import Foundation

protocol ContactViewContract {
    func showError(error: [String]) -> Void
    func showContacts(response: ResponseBase<ContentObjects<Contact>>) -> Void
    func showContact(contact: Contact) -> Void
    func deleteContract(isSuccess: Bool)
}

protocol ContactPresenterContract {
    func getContacts(contactFilter: ContactFilter, page: Int, perPage: Int)
    func deleteContact(contact: Contact)
}


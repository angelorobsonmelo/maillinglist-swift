import Foundation

protocol ContactViewContract {
    func showError(error: [String]) -> Void
    func showContracts(contracts: [Contact?]) -> Void
    func showContract(contract: Contact) -> Void
    func deleteContract(isSuccess: Bool)
}

protocol ContactPresenterContract {
    func getContacts(contactFilter: ContactFilter)
    func saveContact(contact: Contact)
    func deleteContact(contact: Contact)
}

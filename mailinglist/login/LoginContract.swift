import Foundation
import CoreData

protocol LoginViewContract {
    func getToken(token: String) -> Void
    func showError(error: AnyObject) -> Void
    func showUser(user: User) -> Void
}

protocol LoginPresenterContract {
    func login(auth: Auth)
    func saveUser(user: User, with context: NSManagedObjectContext)
    func getUser(with context: NSManagedObjectContext)
}

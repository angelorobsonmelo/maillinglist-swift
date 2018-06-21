import Foundation
import CoreData

protocol LoginViewContract {
    func showError(error: AnyObject) -> Void
    func showUser(user: User) -> Void
    func userLogged(isLogged: Bool) -> Void
}

protocol LoginPresenterContract {
    func login(auth: Auth, isRemeberMe: Bool, with context: NSManagedObjectContext)
    func saveUser(user: User, with context: NSManagedObjectContext)
    func getUser(with context: NSManagedObjectContext)
}

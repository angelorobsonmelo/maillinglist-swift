
import Foundation
import CoreData

public protocol UserLocalRepository {
    
    func save(with user: User, with context: NSManagedObjectContext, onComplete: @escaping (User) -> Void, onError: @escaping (String) -> Void)
    
    func getUser(with context: NSManagedObjectContext, onComplete: @escaping (User) -> Void, empty: @escaping () -> Void, onError: @escaping (String) -> Void)
}

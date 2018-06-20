	
import Foundation
import CoreData

public class UserLocalRepositoryImpl: UserLocalRepository {
   
    var user: User!
    private static var INSTANCE: UserLocalRepository?
    
    public static func getInstance() -> UserLocalRepository {
        if INSTANCE == nil {
            INSTANCE = UserLocalRepositoryImpl()
        }
        
        return INSTANCE!
    }
    
    public func save(with user: User, with context: NSManagedObjectContext, onComplete: @escaping (User) -> Void, onError: @escaping (String) -> Void) {
        do {
            removeAll(with: context)
            try context.save()
            onComplete(user)
        } catch {
            print(error.localizedDescription)
            onError(error.localizedDescription)
        }
   }
    
    public func getUser(with context: NSManagedObjectContext, onComplete: @escaping (User) -> Void, empty: @escaping () -> Void, onError: @escaping (String) -> Void) {
        
        let fetchRequet: NSFetchRequest<User> = User.fetchRequest()
       
        do {
           let users = try context.fetch(fetchRequet)
            if let user = users.first {
                onComplete(user)
                return
            }
            
            empty()

        } catch {
            print(error.localizedDescription)
            onError(error.localizedDescription)
        }
    }
    
    private func removeAll(with context: NSManagedObjectContext) {
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "User"))
        do {
            try context.execute(DelAllReqVar)
        }
        catch {
            print(error)
        }
    }
    
}

import Foundation
import CoreData

class SaveUser {
    
    private let userLocalRepository: UserLocalRepository

    init(userLocalRepository: UserLocalRepository) {
        self.userLocalRepository = userLocalRepository
    }
    
    func save(with user: User, with context: NSManagedObjectContext, onComplete: @escaping (User) -> Void, onError: @escaping (String) -> Void) {
        self.userLocalRepository.save(with: user, with: context, onComplete: { (user) in
            onComplete(user)
        }) { (error) in
            onError(error)
        }
    }
    
}

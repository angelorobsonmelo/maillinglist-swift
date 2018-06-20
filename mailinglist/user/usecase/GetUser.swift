import Foundation
import CoreData

class GetUser {
    
    private let userLocalRepository: UserLocalRepository
    
    init(userLocalRepository: UserLocalRepository) {
        self.userLocalRepository = userLocalRepository
    }
    
    func getUser(with context: NSManagedObjectContext, onComplete: @escaping (User) -> Void, empty: @escaping () -> Void, onError: @escaping (String) -> Void) {
        self.userLocalRepository.getUser(with: context, onComplete: { (user) in
            onComplete(user)
        }, empty: {
            empty()
        }) { (error) in
            onError(error.description)
        }
    }
    
}

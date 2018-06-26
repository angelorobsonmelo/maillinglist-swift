
import Foundation

public class ContactFilter: Codable {
    
    var mustBeSettable: Int?
    var userNameInstagram: String?
    var category: Category?
    var functions: [Role]?
    
    init() {
        
    }
}


import Foundation

public class ContactFilter: Codable {
    
    var userNameInstagram: String?
    var category: Category?
    var functions: [Role]?
    
    init() {
    }
    
    init(userNameInstagram: String, category: Category, functions: [Role]) {
        self.userNameInstagram = userNameInstagram
        self.category = category
        self.functions = functions
    }
    
}

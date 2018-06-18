
import Foundation

struct Auth: Decodable {
    
    let email: String
    let password: String
    
    init(with email: String, with password: String) {
        self.email = email
        self.password = password
    }
}

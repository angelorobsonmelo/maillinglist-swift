
import Foundation
import ObjectMapper

public class Contact: Codable, Mappable {
    
    var id: Int?
    var gender: String?
    var userNameInstagram: String?
    var category: Category?
    var roles: [Role]?
    
    init(id: Int, gender: String, userNameInstagram: String, category: Category, roles: [Role] ) {
        self.id = id
        self.gender = gender
        self.userNameInstagram = userNameInstagram
        self.category = category
        self.roles = roles
    }
    
    init(gender: String, userNameInstagram: String, category: Category, roles: [Role] ) {
        self.gender = gender
        self.userNameInstagram = userNameInstagram
        self.category = category
        self.roles = roles
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        gender <- map["gender"]
        userNameInstagram <- map["userNameInstagram"]
        category <- map["category"]
        roles <- map["functions"]
    }
    
    
}

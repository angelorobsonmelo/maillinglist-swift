import ObjectMapper
import Foundation

class Sort: Mappable {
    var ascending: Bool?
    var descending: Bool?
    var direction: String?
    var ignoreCase: Bool?
    var nullHandling: String?
    var property: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        ascending <- map["ascending"]
        descending <- map["descending"]
        direction <- map["direction"]
        ignoreCase <- map["ignoreCase"]
        nullHandling <- map["nullHandling"]
        property <- map["property"]
    }
}

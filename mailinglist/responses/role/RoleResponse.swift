import ObjectMapper
import Foundation

class RoleResponse: Mappable {
    var errors: [String]?
    var data: DataRole?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        errors <- map["errors"]
        data <- map["data"]
    }
}

class DataRole: Mappable {
    
    var content: [Role]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        content <- map["content"]
    }
}



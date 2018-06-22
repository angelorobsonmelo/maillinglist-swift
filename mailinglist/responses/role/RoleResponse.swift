import ObjectMapper
import Foundation

class RoleResponse<T>: Mappable {
    var errors: [String]?
    var data: T?
    
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



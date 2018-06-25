import ObjectMapper
import Foundation

class ResponseBase<T: Mappable>: Mappable {
    var errors: [String]?
    var data: T?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        errors <- map["errors"]
        data <- map["data"]
    }
}

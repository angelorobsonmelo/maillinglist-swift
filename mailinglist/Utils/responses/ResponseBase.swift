import ObjectMapper
import Foundation

public class ResponseBase<T: Mappable>: Mappable {
    var errors: [String]?
    var data: T?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        errors <- map["errors"]
        data <- map["data"]
    }
}

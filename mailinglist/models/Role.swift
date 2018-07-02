import Foundation
import ObjectMapper
import RSSelectionMenu

public class Role: NSObject, Codable, Mappable, UniqueProperty {
    
    var id: Int?
    var function: String?
    
    init(id: Int, function: String) {
        self.id = id
        self.function = function
    }
    
    init(function: String) {
        self.function = function
    }
    
    required public init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        function <- map["function"]
    }
    
    public func uniquePropertyName() -> String {
        return "id"
    }
}


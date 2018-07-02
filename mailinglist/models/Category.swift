import Foundation
import ObjectMapper
import RSSelectionMenu

public class Category: NSObject, Codable, Mappable, UniqueProperty {
    
    var id: Int?
    var category: String?
    
    init(id: Int, category: String) {
        self.id = id
        self.category = category
    }
    
    init(category: String) {
        self.category = category
    }
    
    required public init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        category <- map["category"]
    }
    
    public func uniquePropertyName() -> String {
        return "id"
    }
}


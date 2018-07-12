import ObjectMapper
import Foundation

public class ContentObjects<T: Mappable>: PropertiesBase {
    
    var content: [T]?
    
    required public init?(map: Map) {
      super.init(map: map)
    }

    override public func mapping(map: Map) {
        super.mapping(map: map)
        content <- map["content"]
    }
}



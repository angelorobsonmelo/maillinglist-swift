import ObjectMapper
import Foundation

class ContentObjects<T: Mappable>: PropertiesBase {
    
    var content: [T]?
    
    required init?(map: Map){
      super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        content <- map["content"]
    }
}



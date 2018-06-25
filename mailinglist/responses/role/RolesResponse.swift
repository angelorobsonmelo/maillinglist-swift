import ObjectMapper
import Foundation

class DataRoles: PropertiesBase {
    
    var content: [Role]?
    
    required init?(map: Map){
      super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        content <- map["content"]
    }
}



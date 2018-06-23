import ObjectMapper
import Foundation

class DataRole: Mappable {
    
    var content: Role?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        content <- map["data"]
    }
}



import ObjectMapper
import Foundation

class DataRoles: Mappable {

     var content: [Role]?

    required init?(map: Map){

    }

    func mapping(map: Map) {
        content <- map["content"]
    }
}



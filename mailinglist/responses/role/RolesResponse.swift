import ObjectMapper
import Foundation

class RolesResponse: Mappable {
    var errors: String? 
    var data: Data?

    required init?(map: Map){

    }

    func mapping(map: Map) {
        errors <- map["errors"]
        data <- map["data"]
    }
}

class Data: Mappable {

     var content: [Role]?

    required init?(map: Map){

    }

    func mapping(map: Map) {
        content <- map["content"]
    }
}



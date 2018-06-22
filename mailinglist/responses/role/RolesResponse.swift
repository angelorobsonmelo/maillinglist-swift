import ObjectMapper
import Foundation

class RolesResponse: Mappable {
    var errors: [String]?
    var data: DataRoles?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        errors <- map["errors"]
        data <- map["data"]
    }
}

class DataRoles: Mappable {

     var content: [Role]?

    required init?(map: Map){

    }

    func mapping(map: Map) {
        content <- map["content"]
    }
}


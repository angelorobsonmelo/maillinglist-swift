import ObjectMapper
import Foundation

class RolesResponse<T: Mappable>: Mappable {
    var errors: [String]?
    var data: T?

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



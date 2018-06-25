import ObjectMapper
import Foundation

class DataRoles: Mappable {
    
    var content: [Role]?
    
    var first: Bool?
    var last: Bool?
    var number: Int?
    var numberOfElements: Int?
    var totalElements: Int?
    var totalPages: Int?
    var sort: [Sort]?
    
    required init?(map: Map){

    }

    func mapping(map: Map) {
        content <- map["content"]
        first <-   map["first"]
        last <-   map["last"]
        number <-   map["number"]
        numberOfElements <-   map["numberOfElements"]
        totalElements <-   map["totalElements"]
        totalPages    <-   map["totalPages"]
        sort <-   map["sort"]

    }
}



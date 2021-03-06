import ObjectMapper
import Foundation

public class PropertiesBase: Mappable {
    
    var first: Bool?
    var last: Bool?
    var number: Int?
    var numberOfElements: Int?
    var totalElements: Int?
    var totalPages: Int?
    var sort: [Sort]?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        first <-   map["first"]
        last <-   map["last"]
        number <-   map["number"]
        numberOfElements <-  map["numberOfElements"]
        totalElements <-  map["totalElements"]
        totalPages    <-  map["totalPages"]
        sort <-   map["sort"]
        
    }
}



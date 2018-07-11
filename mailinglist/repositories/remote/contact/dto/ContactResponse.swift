
import Foundation
import ObjectMapper

public class ContactResponse: Mappable {
    var errors: [String]?
    var data: ResponseObjects<Contact>?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        errors <- map["errors"]
        data <- map["data"]
    }
}

class ResponseObjects<T: Mappable>: BaseResponse {
    
    var content: [T]?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        content <- map["content"]
    }
}

class ResponseObject<T: Mappable>: BaseResponse {
    
    var data: T?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        content <- map["data"]
    }
}


public class BaseResponse: Mappable {
    
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

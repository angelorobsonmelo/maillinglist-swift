import Foundation

public class Role: Codable {
    
    var id: Optional<Int> = Optional.none
    var function: String
    
    init(id: Int, function: String) {
        self.id = id
        self.function = function
    }
    
    init(function: String) {
        self.function = function
    }
}


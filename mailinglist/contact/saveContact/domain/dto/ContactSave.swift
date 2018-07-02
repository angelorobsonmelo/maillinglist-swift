
import Foundation

public class ContactSave: Codable {
    
    var id: Int?
    var userNameInstagram: String?
    var categoryId: Int?
    var functionsIds: [Int]?
    var gender: String?
    var registrationDate: Date?
    var userAppId: Int?
    
    init(id: Int, userNameInstagram: String, categoryId: Int, functionsIds: [Int], gender: String, registrationDate: Date, userAppId: Int) {
        self.id = id
        self.userNameInstagram = userNameInstagram
        self.categoryId = categoryId
        self.functionsIds = functionsIds
        self.gender = gender
        self.registrationDate = registrationDate
        self.userAppId = userAppId
    }
    
    init(userNameInstagram: String, categoryId: Int, functionsIds: [Int], gender: String, registrationDate: Date, userAppId: Int) {
        self.userNameInstagram = userNameInstagram
        self.categoryId = categoryId
        self.functionsIds = functionsIds
        self.gender = gender
        self.registrationDate = registrationDate
        self.userAppId = userAppId
    }
}

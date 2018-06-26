
import Foundation

class InjectionUseCase {
    
    private static let loginRemoteRepository = InjectionRemoteRepository.provideLoginRemoteRepository()
    private static let userLocalRepository = InjectionLocalRepository.provideUserLocalRespository()
    private static let roleRemoteRepository = InjectionRemoteRepository.provideRoleRemoteRepository()
    private static let categoryRepository = InjectionRemoteRepository.provideCategoryRemoteRepository()
    private static let contactRepository = InjectionRemoteRepository.provideContactRemoteRepository()
    
    class func provideGetAuth() -> GetAuth {
        return GetAuth(loginRemoteRepository: loginRemoteRepository)
    }
    
    class func provideSaveUser() -> SaveUser {
       return SaveUser(userLocalRepository: userLocalRepository)
    }
    
    class func provideGetUser() -> GetUser {
        return GetUser(userLocalRepository: userLocalRepository)
    }
    
    class func provideGetRoles() -> GetRoles {
        return GetRoles(roleRemoteRepository: roleRemoteRepository)
    }
    
    class func provideSaveRole() -> SaveRole {
        return SaveRole(roleRemoteRepository: roleRemoteRepository)
    }
    
    class func provideDeleteRole() -> DeleteRole {
        return DeleteRole(roleRemoteRepository: roleRemoteRepository)
    }
    
    class func provideGetCategories() -> GetCategories {
        return GetCategories(categoryRemoteRepository: categoryRepository)
    }
    
    class func provideSaveCategory() -> SaveCategory {
        return SaveCategory(categoryRemoteRepository: categoryRepository)
    }
    
    class func provideDeleteCategory() -> DeleteCategory {
        return DeleteCategory(categoryRemoteRepository: categoryRepository)
    }
    
    class func provideGetContacts() -> getContacts {
        return getContacts(contactRemoteRepository: contactRepository)
    }
}

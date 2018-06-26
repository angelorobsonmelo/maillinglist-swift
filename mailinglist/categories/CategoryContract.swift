import Foundation

protocol CategoryViewContract {
    func showError(error: [String]) -> Void
    func showCategories(categories: [Category]) -> Void
    func showCategory(category: Category) -> Void
    func deleteCategory(isSuccess: Bool)
}

protocol CategoryPresenterContract {
    func getCategories()
    func saveCategory(category: Category)
    func deleteCategory(category: Category)
}

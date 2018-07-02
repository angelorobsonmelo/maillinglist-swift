import Foundation

protocol SaveContactViewContract {
    func showError(error: [String]) -> Void
    func showCategories(categories: [Category]) -> Void
}

protocol SaveContactPresenterContract {
    func getCategories()
}


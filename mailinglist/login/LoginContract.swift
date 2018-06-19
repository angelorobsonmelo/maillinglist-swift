import Foundation

protocol LoginViewContract {
    func getToken(token: String) -> Void
    func showError(error: AnyObject) -> Void
}

protocol LoginPresenterContract {
    func login(auth: Auth)
}

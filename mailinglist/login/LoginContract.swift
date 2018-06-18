import Foundation

protocol LoginViewContract {
    func getToken(token: String) -> Void
}

protocol LoginPresenterContract {
    func login(auth: Auth)
}

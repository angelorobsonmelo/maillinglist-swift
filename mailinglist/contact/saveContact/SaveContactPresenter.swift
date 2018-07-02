import Foundation

class SaveContactPresenter: SaveContactPresenterContract {
    
    let view: SaveContactViewContract
    let getCategoriesUseCase: GetCategories
    
    init(view: SaveContactViewContract, getCategoriesUseCase: GetCategories) {
        self.view = view
        self.getCategoriesUseCase = getCategoriesUseCase
    }
    
    func getCategories() {
        getCategoriesUseCase.getCategories(onSuccess: { (cetegories) in
            self.view.showCategories(categories: cetegories as! [Category])
        }, onEmpty: {
            
        }) { (error) in
            self.view.showError(error: error)
        }
    }
    
}

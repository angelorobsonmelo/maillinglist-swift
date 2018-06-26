import Foundation

class CategoryPresenter: CategoryPresenterContract {
    
    let view: CategoryViewContract
    let getCategoriesUseCase: GetCategories
    let saveCategory: SaveCategory
    let deleteCategory: DeleteCategory
    
    init(view: CategoryViewContract, getCategories: GetCategories, saveCategory: SaveCategory, deleteCategory: DeleteCategory) {
        self.view = view
        self.getCategoriesUseCase = getCategories
        self.saveCategory = saveCategory
        self.deleteCategory = deleteCategory
    }
    
    func getCategories() {
        getCategoriesUseCase.getCategories(onSuccess: { (response) in
            self.view.showCategories(categories: response as! [Category])
        }, onEmpty: {
            
        }) { (error) in
            self.view.showError(error: error)
        }
    }
    
    func saveCategory(category: Category) {
        saveCategory.saveCategory(category: category, onSuccess: { (response) in
            self.view.showCategory(category: response!)
        }, onEmpty: {

        }) { (error) in
            self.view.showError(error: error)
        }
    }
    
    func deleteCategory(category: Category) {
        self.deleteCategory.delete(category: category, onSuccess: { (response) in
            if let isSuccess = response {
                self.view.deleteCategory(isSuccess: isSuccess)
            }
        }, onError: { (error) in
            self.view.showError(error: error)
        })
    }
    
    
}

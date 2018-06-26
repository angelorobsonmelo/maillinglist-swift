//
//  SaveCategory.swift
//  mailinglist
//
//  Created by stant on 25/06/18.
//  Copyright © 2018 angelorobson. All rights reserved.
//

import Foundation

class SaveCategory {
    
    private let categoryRemoteRepository: CategoryRemoteRepository
    
    init(categoryRemoteRepository: CategoryRemoteRepository) {
        self.categoryRemoteRepository = categoryRemoteRepository
    }
    
    func saveCategory(category: Category, onSuccess: @escaping (Category?) -> Void, onEmpty: @escaping () -> Void, onError: @escaping ([String]) -> Void) {
        self.categoryRemoteRepository.save(category: category
            , onSuccess: { (response) in
                onSuccess(response)
        }, onEmpty: {
            
        }) { (error) in
            onError(error)
        }
    }
    
}

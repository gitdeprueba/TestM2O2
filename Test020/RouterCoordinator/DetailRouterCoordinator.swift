//
//  DetailRouterCoordinator.swift
//  Test020
//
//  Created by Nacho Garcia on 3/4/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import UIKit

class DetailRouterCoordinator {
    
    var rootViewController : UIViewController?
    private let detailRecipeViewModelProvider : DetailRecipeViewModelProvider
    
    init(detailRecipeViewModelProvider : DetailRecipeViewModelProvider, recipe: Result) {
        self.detailRecipeViewModelProvider = detailRecipeViewModelProvider
        let detailVM = self.detailRecipeViewModelProvider.detailRecipeViewModel(recipe: recipe)
        let detailVC = DetailRecipeViewController(viewModel: detailVM)
        rootViewController = detailVC
    }
    
}

class DetailRouterCoordinatorProvider {
    
    private let detailRecipeViewModelProvider :  DetailRecipeViewModelProvider
    
    init(detailRecipeViewModelProvider :  DetailRecipeViewModelProvider) {
        self.detailRecipeViewModelProvider = detailRecipeViewModelProvider
    }
    
    func detailRouterCoordinator(recipe: Result) -> DetailRouterCoordinator{
        return DetailRouterCoordinator(detailRecipeViewModelProvider: detailRecipeViewModelProvider, recipe: recipe)
    }
}

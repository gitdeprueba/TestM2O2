//
//  RouterCoordinator.swift
//  Test020
//
//  Created by Nacho Garcia on 3/4/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import UIKit


class RouterCoordinator: ViewModelDelegateUserDidTap {
    
    private let navigationController : UINavigationController
    private let network : WebServiceLayer
    private let viewModelProvider : ViewModelProvider
    private let detailRecipeCoordinatorProvider: DetailRouterCoordinatorProvider
    
    var rootViewController: UIViewController {
        get{
            return navigationController
        }
    }
    
    init(network: WebServiceLayer, viewModelProvider : ViewModelProvider, detailRecipeCoordinatorProvider: DetailRouterCoordinatorProvider) {
        self.network = network
        self.viewModelProvider = viewModelProvider
        self.detailRecipeCoordinatorProvider = detailRecipeCoordinatorProvider
        
        let rootViewModel = viewModelProvider.retrieveViewModel()
        let rootVC = ViewController(viewModel: rootViewModel)
        self.navigationController =  UINavigationController(rootViewController: rootVC)
        rootViewModel.delegeateUserTap = self
    }
    
    func userDidTapInRowDelegate(_: ViewModel, recipe: Result) {
        let detailCoordinator = self.detailRecipeCoordinatorProvider.detailRouterCoordinator(recipe: recipe)
        self.navigationController.pushViewController(detailCoordinator.rootViewController!, animated: true)
    }
    
    
}

//
//  ViewModel.swift
//  Test020
//
//  Created by Nacho Garcia on 3/4/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import UIKit

class ViewModel {
    
    private let network: WebServiceLayer
    weak var delegate: ViewModelDelegate?
    weak var delegeateUserTap: ViewModelDelegateUserDidTap?
    private var recipes : Recipe?
    private(set) var cellsViewModel : [RecipeCellViewModel] = []
    
    init(network: WebServiceLayer) {
        self.network = network
    }

    func retrieveRecipes(nameRecipe: String) {
        
        network.retrieveRecipe(recipeName: nameRecipe, { (recipes) in
            self.cellsViewModel = []
            
            if recipes?.results.count != 0{
                self.recipes = recipes
                for recipeResult in (recipes?.results)! {
                    let viewModel = RecipeCellViewModel(recipeResult: recipeResult)
                    self.cellsViewModel.append(viewModel)
                }
            }
            self.delegate?.recipeListDidUpdateDelegate(self)
        }) { (error) in
            self.delegate?.recipeListDidUpdateDelegate(self)
            print("ERROR RETRIEVING RECIPES")
        }
    }
    
    func userDidTapInRow(row: Int){
        if let recipe = self.recipes?.results[row]{
            self.delegeateUserTap?.userDidTapInRowDelegate(self, recipe: recipe)
        }
    }
    
}

class ViewModelProvider {
    
    private let network : WebServiceLayer
    
    init(network : WebServiceLayer) {
        self.network = network
    }
    func retrieveViewModel() -> ViewModel{
        return ViewModel(network: network)
    }
}

protocol ViewModelDelegate: class {
    func recipeListDidUpdateDelegate(_: ViewModel)
}

protocol ViewModelDelegateUserDidTap: class {
    func userDidTapInRowDelegate(_:ViewModel, recipe: Result)
}

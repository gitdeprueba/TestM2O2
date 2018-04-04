//
//  DetailRecipeViewModel.swift
//  Test020
//
//  Created by Nacho Garcia on 3/4/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import Foundation

class DetailRecipeViewModel {
    
    private let recipe: Result

    init(recipe: Result) {
        self.recipe = recipe
    }
    
    var titleRecipe:String{
        get{
            return recipe.title
        }
    }
    
    var ingredients: String{
        get{
            return recipe.ingredients
        }
    }
}

class DetailRecipeViewModelProvider {
    
    func detailRecipeViewModel(recipe: Result) -> DetailRecipeViewModel {
        return DetailRecipeViewModel(recipe: recipe)
    }
}



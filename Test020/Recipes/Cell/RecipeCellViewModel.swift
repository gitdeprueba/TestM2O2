//
//  RecipeCellViewModel.swift
//  Test020
//
//  Created by Nacho Garcia on 3/4/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import Foundation

class RecipeCellViewModel{
    
    private let recipeResult : Result
    
    init(recipeResult: Result) {
        self.recipeResult = recipeResult
    }
    
    var imgRecipe : String {
        get{
            return recipeResult.thumbnail
        }
    }
    
    var titleRecipe : String {
        get{
            return recipeResult.title
        }
    }
}

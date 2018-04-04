//
//  WebServiceLayer.swift
//  Test020
//
//  Created by Nacho Garcia on 3/4/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import Foundation
import Alamofire

class WebServiceLayer {
    
    
    func retrieveRecipe(recipeName: String, _ completion:@escaping ServicesTypeAlias.recipeClosure,  _ completionError:@escaping ServicesTypeAlias.errorClosure) {
        
        let url = "http://www.recipepuppy.com/api/?q=\(recipeName)"
        
        Alamofire.request(url).responseData { (data) in
            
            if let recipes = data.data {
                do{
                    let dict = try JSONSerialization.jsonObject(with: recipes, options: []) as? [String:Any]
                    let recipesModel = Recipe(fromDictionary: dict!)
                    completion(recipesModel)
                    
                }catch let error {
                    print("Error \(error) retrieving recipes")
                    completionError(error)
                }
            }
        }
    }
    
}

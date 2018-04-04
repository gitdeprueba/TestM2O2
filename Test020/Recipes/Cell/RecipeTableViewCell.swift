//
//  RecipeTableViewCell.swift
//  Test020
//
//  Created by Nacho Garcia on 3/4/18.
//  Copyright © 2018 com.nacho. All rights reserved.


import UIKit
import SDWebImage

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgViewRecipe: UIImageView!
    @IBOutlet weak var lblTitleRecipe: UILabel!
    
    var viewModel: RecipeCellViewModel? {
        didSet{
            self.lblTitleRecipe.text = viewModel?.titleRecipe
            if let image = viewModel?.imgRecipe {
                self.imgViewRecipe.sd_setImage(with: URL(string: image),
                                               placeholderImage: #imageLiteral(resourceName: "PlaceHolder"),
                                               options: SDWebImageOptions.continueInBackground,
                                               completed: nil)
            }
        }
    }
    
}

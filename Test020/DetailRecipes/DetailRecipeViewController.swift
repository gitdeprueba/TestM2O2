//
//  DetailRecipeViewController.swift
//  Test020
//
//  Created by Nacho Garcia on 3/4/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import UIKit

class DetailRecipeViewController: UIViewController {
    
    @IBOutlet weak var lblIngredients: UILabel!
    private let viewModel : DetailRecipeViewModel
    
    init(viewModel: DetailRecipeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.titleRecipe
        self.lblIngredients.text = self.viewModel.ingredients
    }
}

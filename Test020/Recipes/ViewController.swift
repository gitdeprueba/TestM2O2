//
//  ViewController.swift
//  Test020
//
//  Created by Nacho Garcia on 3/4/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewModelDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    private let viewModel : ViewModel
    let searchController = UISearchController(searchResultsController: nil)
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Recipes"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let uiNib = UINib(nibName: "RecipeTableViewCell", bundle: nil)
        self.tableView.register(uiNib, forCellReuseIdentifier: "RecipeTableViewCell")
        self.tableView.rowHeight = 83.0
        self.tableView.separatorStyle = .none
        
        //Call WS without recipe to show random ones.
        self.viewModel.retrieveRecipes(nameRecipe: "")
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Recipes"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func recipeListDidUpdateDelegate(_: ViewModel) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell", for: indexPath) as! RecipeTableViewCell
        let cellViewModel = self.viewModel.cellsViewModel[indexPath.row]
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cellsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.userDidTapInRow(row: indexPath.row)
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        if let text = searchController.searchBar.text{
            self.viewModel.retrieveRecipes(nameRecipe: text)
        }
    }
}










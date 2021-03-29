//
//  ArticleDataSource.swift
//  NewsAppMVVM
//
//  Created by Moubeen Farooq on 1/9/21.
//

import Foundation
import UIKit

class ArticleDataSource: NSObject {
    
    
    // MARK: -  Properties
    
    fileprivate var viewModel: ArticleListViewModel
    
    
    // MARK: -  Initializations
    
    init(viewModel: ArticleListViewModel) {
        self.viewModel = viewModel
    }
    
    func updateData(data : [ArticleViewModel]?) {
        self.viewModel.articlesVM = data
    }
    // MARK: -  Public methods
    
    fileprivate func configure(_ cell: SelectFillableCell, for row: Int) -> UITableViewCell {
        cell.fill(self.viewModel.articleAt(row))
        return cell
    }
    
}
extension ArticleDataSource: UITableViewDataSource, UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.viewModel.articlesVM == nil ? 0 : self.viewModel.articlesVM!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = ArticleTableViewCell.self
        let cell = tableView.reusableCell(cellType, for: indexPath)

        return self.configure(cell, for: indexPath.row)
    }
}

//
//  NewsTableViewController.swift
//  NewsAppMVVM
//
//  Created by Moubeen Farooq on 1/9/21.
//

import Foundation
import UIKit

class NewsTableViewController: UITableViewController {
    
    private var articleListVM : ArticleListViewModel?
    private var dataSource: ArticleDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articleListVM = ArticleListViewModel()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.setupTableView()
        self.populateNews()
    }

    private func setupTableView() {
        let tableView = self.tableView
        tableView?.register(cellClass: ArticleTableViewCell.self)
        dataSource = self.articleListVM!.articleDataSource()
        tableView?.dataSource = dataSource
        tableView?.delegate = self
        tableView?.tableFooterView = UIView()
        //tableView?.rowHeight = 56
    }
    
    private func populateNews() {
        
        self.articleListVM?.articleAPICall(onSuccess:({ [weak self] articles in
            self?.articleListVM?.updateArticles(articles: articles)
            self?.dataSource?.updateData(data: self?.articleListVM?.articlesVM)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }), onFailure: ({ error in
            print(error)
            
        }), onEmpty: ({ dataEmpty in
            print(dataEmpty)
        }))
        
    }
}

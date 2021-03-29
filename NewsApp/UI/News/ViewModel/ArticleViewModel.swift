//
//  ArticleViewModel.swift
//  NewsAppMVVM
//
//  Created by Moubeen Farooq on 1/9/21.
//

import Foundation
import RxSwift
import RxCocoa

class ArticleListViewModel {
    var articlesVM: [ArticleViewModel]? = []
    private let bag = DisposeBag()
    init() {
    }
    
    init(_ articles: [Article]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
    }
}

extension ArticleListViewModel {
    
    func articleDataSource() -> ArticleDataSource {
        return  ArticleDataSource(viewModel: self)
    }
    func articleAt(_ index: Int) -> ArticleViewModel {
        return self.articlesVM![index]
    }
    func updateArticles(articles: [Article]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
    }
}
extension ArticleListViewModel {
    
    func articleAPICall(
        onSuccess: @escaping ([Article]) -> (),
        onFailure: @escaping (String) ->(),
        onEmpty: @escaping (String) ->()) {
        
        URLRequest.load(resource: ArticleResponse.all)
            .subscribe(onNext: {articleResponse in
                let articles = articleResponse.articles
                if articles.count > 0 {
                    onSuccess(articleResponse.articles)
                }else if articles.count == 0 {
                    onEmpty("No Data Found")
                }else {
                    onFailure("Someting Not working")
                }
            }).disposed(by: bag)
    }
}

struct ArticleViewModel {
    
    let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
    
}
extension ArticleViewModel {
    
    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
    
}

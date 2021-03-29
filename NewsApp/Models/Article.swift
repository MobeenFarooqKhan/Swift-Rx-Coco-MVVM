//
//  Article.swift
//  NewsAppMVVM
//
//  Created by Moubeen Farooq on 1/9/21.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}

extension ArticleResponse {
    static var all : Resource<ArticleResponse> = {
        let url = URL(string: Constants.TOP_HEADLINES)!
        return Resource(url: url)
    }()
}


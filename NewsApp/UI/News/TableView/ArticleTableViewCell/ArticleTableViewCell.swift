//
//  ArticleTableViewCell.swift
//  NewsAppMVVM
//
//  Created by Moubeen Farooq on 1/9/21.
//
import Foundation
import UIKit
import RxSwift

class SelectFillableCell: UITableViewCell {
    func fill(_ model: ArticleViewModel) { }
}
class ArticleTableViewCell: SelectFillableCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func fill(_ model: ArticleViewModel) {
        
        model.title.asDriver(onErrorJustReturn: "")
            .drive(self.titleLabel.rx.text)
        .disposed(by: disposeBag)
        
        model.description.asDriver(onErrorJustReturn: "")
            .drive(self.descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
    }
    
}

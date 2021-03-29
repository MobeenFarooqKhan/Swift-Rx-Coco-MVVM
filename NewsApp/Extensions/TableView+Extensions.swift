//
//  TableView+Extensions.swift
//  NewsAppMVVM
//
//  Created by Moubeen Farooq on 1/9/21.
//

import Foundation
import UIKit


extension UITableView {
    
    func reusableCell<T: UITableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        let reuseIdentifier = String(describing: type)
        guard let cell = self.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to find cell with reuseIdentifier \"\(reuseIdentifier)\"")
        }
        
        return cell
    }
    func register(cellClass: AnyClass) {
        self.register(.nib(withClass: cellClass), forCellReuseIdentifier: String(describing: cellClass.self))
    }
    func reloadData(with animation: UITableView.AnimationOptions, duration: Double = 0.3) {
        UIView.transition(with: self, duration: duration,
                          options: animation, animations: {
                            self.reloadData()
        }, completion: nil)
    }
}
          

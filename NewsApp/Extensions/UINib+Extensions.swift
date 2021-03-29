//
//  UINib+Extensions.swift
//  NewsAppMVVM
//
//  Created by Moubeen Farooq on 1/9/21.
//

import UIKit
import Foundation
extension UINib {
    
    static func nib(withClass cls: AnyClass) -> UINib {
        return self.nib(withClass: cls, bundle: nil)
    }
    
    static func nib(withClass cls: AnyClass, bundle: Bundle?) -> UINib {
        return UINib(nibName: String(describing: cls), bundle: bundle)
    }
}

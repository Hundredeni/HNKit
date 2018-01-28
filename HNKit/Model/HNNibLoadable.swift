//
//  HNNibLoadable.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import UIKit

protocol HNNibLoadable {
    static var nibName: String { get }
    static var nib: UINib { get }
}

extension HNNibLoadable {
    
    static var nibName: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
}

extension HNNibLoadable where Self: UIView {
    
    static func fromNib() -> Self {
        return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)![0] as! Self
    }
}
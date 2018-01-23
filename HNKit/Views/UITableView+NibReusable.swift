//
//  UITableView+NibReusable.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell & NibReusable>(reusableType: T.Type) {
        register(reusableType.nib, forCellReuseIdentifier: reusableType.nibReuseIdentifier)
    }
    
    func dequeue<T: UITableViewCell & NibReusable>(reusableType: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: reusableType.nibReuseIdentifier, for: indexPath) as? T
    }
}

//
//  UICollectionView+HNNibReusable.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    func register<T: UICollectionViewCell & HNNibReusable>(reusableType: T.Type) {
        register(reusableType.nib, forCellWithReuseIdentifier: reusableType.nibReuseIdentifier)
    }
    
    func dequeue<T: UICollectionViewCell & HNNibReusable>(reusableType: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: reusableType.nibReuseIdentifier, for: indexPath) as? T
    }
}

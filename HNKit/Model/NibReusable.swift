//
//  NibReusable.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import UIKit

protocol NibReusable: NibLoadable {
    static var nibReuseIdentifier: String { get }
}

extension NibReusable {
    
    static var nibReuseIdentifier: String {
        return String(describing: self)
    }
}


//
//  HNTableViewSection.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import Foundation

public struct HNTableViewSection {
    
    public var items: [HNTableViewItem]
    
    public init(items: [HNTableViewItem] = []) {
        self.items = items
    }
}

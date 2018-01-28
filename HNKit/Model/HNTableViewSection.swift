//
//  HNTableViewSection.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import Foundation

struct HNTableViewSection {
    
    var items: [HNTableViewItem]
    
    init(items: [HNTableViewItem] = []) {
        self.items = items
    }
}

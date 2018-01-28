//
//  HNTableViewStructure.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import Foundation

struct HNTableViewStructure {
    
    var sections: [HNTableViewSection]
    
    subscript(_ indexPath: IndexPath) -> HNTableViewItem {
        get {
            return sections[indexPath.section].items[indexPath.row]
        }
        set {
            sections[indexPath.section].items[indexPath.row] = newValue
        }
    }
    
    
    func containsItem(at indexPath: IndexPath) -> Bool {
        guard
            indexPath.section < sections.count,
            indexPath.row < sections[indexPath.section].items.count
        else {
            return false
        }
        return true
    }
    
    var isEmpty: Bool {
        return sections.isEmpty
    }
}

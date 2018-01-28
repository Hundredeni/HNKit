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
    
    init(sections: [HNTableViewSection] = []) {
        self.sections = sections
    }
    
    subscript(_ indexPath: IndexPath) -> HNTableViewItem {
        get {
            return sections[indexPath.section].items[indexPath.row]
        }
        set {
            sections[indexPath.section].items[indexPath.row] = newValue
        }
    }
    
    mutating func insert(_ newItem: HNTableViewItem, at indexPath: IndexPath) {
        sections[indexPath.section].items.insert(newItem, at: indexPath.row)
    }
    
    mutating func insert(contentsOf newItems: [HNTableViewItem], at indexPath: IndexPath) {
        sections[indexPath.section].items.insert(contentsOf: newItems, at: indexPath.row)
    }
    
    mutating func remove(at indexPath: IndexPath) -> HNTableViewItem {
        return sections[indexPath.section].items.remove(at: indexPath.row)
    }
    
    mutating func moveItem(from previousIndexPath: IndexPath, to newIndexPath: IndexPath) {
        let item = remove(at: previousIndexPath)
        insert(item, at: newIndexPath)
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
}

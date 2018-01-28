//
//  HNTableViewStructure.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import Foundation

public struct HNTableViewStructure {
    
    public var sections: [HNTableViewSection]
    
    public init(sections: [HNTableViewSection] = []) {
        self.sections = sections
    }
    
    public subscript(_ indexPath: IndexPath) -> HNTableViewItem {
        get {
            return sections[indexPath.section].items[indexPath.row]
        }
        set {
            sections[indexPath.section].items[indexPath.row] = newValue
        }
    }
    
    public mutating func insert(_ newItem: HNTableViewItem, at indexPath: IndexPath) {
        sections[indexPath.section].items.insert(newItem, at: indexPath.row)
    }
    
    public mutating func insert(contentsOf newItems: [HNTableViewItem], at indexPath: IndexPath) {
        sections[indexPath.section].items.insert(contentsOf: newItems, at: indexPath.row)
    }
    
    @discardableResult
    public mutating func remove(at indexPath: IndexPath) -> HNTableViewItem {
        return sections[indexPath.section].items.remove(at: indexPath.row)
    }
    
    public mutating func moveItem(from sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = remove(at: sourceIndexPath)
        insert(item, at: destinationIndexPath)
    }
    
    public func containsItem(at indexPath: IndexPath) -> Bool {
        guard
            indexPath.section < sections.count,
            indexPath.row < sections[indexPath.section].items.count
            else {
                return false
        }
        return true
    }
}

//
//  HNTableViewSectionBuilder.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 28/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import Foundation

class HNTableViewSectionBuilder {
    
    fileprivate var items: [HNTableViewItem]
    
    init(section: HNTableViewSection) {
        items = section.items
    }
    
    init(items: [HNTableViewItem] = []) {
        self.items = items
    }
    
    func build() -> HNTableViewSection {
        return HNTableViewSection(items: items)
    }
    
    @discardableResult
    func append(_ item: HNTableViewItem) -> HNTableViewSectionBuilder {
        items.append(item)
        return self
    }
    
    @discardableResult
    func append(contentsOf items: [HNTableViewItem]) -> HNTableViewSectionBuilder {
        self.items.append(contentsOf: items)
        return self
    }
    
    @discardableResult
    func insert(_ item: HNTableViewItem, at index: Int) -> HNTableViewSectionBuilder {
        items.insert(item, at: index)
        return self
    }
    
    @discardableResult
    func insert(contentsOf items: [HNTableViewItem], at index: Int) -> HNTableViewSectionBuilder {
        self.items.insert(contentsOf: items, at: index)
        return self
    }
    
    @discardableResult
    func prepend(_ item: HNTableViewItem) -> HNTableViewSectionBuilder {
        return insert(item, at: 0)
    }
    
    @discardableResult
    func prepend(contentsOf items: [HNTableViewItem]) -> HNTableViewSectionBuilder {
        return insert(contentsOf: items, at: 0)
    }
}

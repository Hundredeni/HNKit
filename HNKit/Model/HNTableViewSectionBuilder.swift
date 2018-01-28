//
//  HNTableViewSectionBuilder.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 28/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import Foundation

open class HNTableViewSectionBuilder {
    
    fileprivate var items: [HNTableViewItem]
    fileprivate var headerTitle: String?
    fileprivate var footerTitle: String?
    fileprivate var identifier: String?
    
    public init(items: [HNTableViewItem] = [], headerTitle: String? = nil, footerTitle: String? = nil, identifier: String? = nil) {
        self.items = items
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.identifier = identifier
    }
    
    open func build() -> HNTableViewSection {
        return HNTableViewSection(items: items, headerTitle: headerTitle, footerTitle: footerTitle, identifier: identifier)
    }
    
    
    @discardableResult
    public func set(headerTitle: String?) -> HNTableViewSectionBuilder {
        self.headerTitle = headerTitle
        return self
    }
    
    @discardableResult
    public func set(footerTitle: String?) -> HNTableViewSectionBuilder {
        self.footerTitle = footerTitle
        return self
    }
    
    @discardableResult
    public func set(identifier: String?) -> HNTableViewSectionBuilder {
        self.identifier = identifier
        return self
    }
    
    @discardableResult
    public func addItem(_ item: HNTableViewItem) -> HNTableViewSectionBuilder {
        items.append(item)
        return self
    }
    
    @discardableResult
    public func addItems(_ items: [HNTableViewItem]) -> HNTableViewSectionBuilder {
        self.items.append(contentsOf: items)
        return self
    }
    
    @discardableResult
    public func addItemUsingBuilder(_ builderBlock: ((HNTableViewItemBuilder) -> Void)?) -> HNTableViewSectionBuilder {
        let builder = HNTableViewItemBuilder()
        builderBlock?(builder)
        let item = builder.build()
        return addItem(item)
    }
}

//
//  HNTableViewItemBuilder.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import UIKit

open class HNTableViewItemBuilder {
    
    fileprivate var type: HNTableViewCell.Type
    fileprivate var value: Any?
    fileprivate var identifier: String?
    fileprivate var configuration: ((HNTableViewCell) -> Void)?
    
    public init(item: HNTableViewItem) {
        type = item.type
        value = item.value
        identifier = item.identifier
        configuration = item.configuration
    }
    
    public init(type: HNTableViewCell.Type = HNTableViewCell.self, value: Any? = nil, identifier: String? = nil, configuration: ((HNTableViewCell) -> Void)? = nil) {
        self.type = type
        self.value = value
        self.identifier = identifier
        self.configuration = configuration
    }
    
    open func build() -> HNTableViewItem {
        return HNTableViewItem(type: type, value: value, identifier: identifier, configuration: configuration)
    }
    
    @discardableResult
    public func set(type: HNTableViewCell.Type) -> HNTableViewItemBuilder {
        self.type = type
        return self
    }
    
    @discardableResult
    public func set(value: Any?) -> HNTableViewItemBuilder {
        self.value = value
        return self
    }
    
    @discardableResult
    public func set(identifier: String?) -> HNTableViewItemBuilder {
        self.identifier = identifier
        return self
    }
    
    @discardableResult
    public func set(configuration: ((HNTableViewCell) -> Void)?) -> HNTableViewItemBuilder {
        self.configuration = configuration
        return self
    }
    
    @discardableResult
    public func set(accessoryType: UITableViewCellAccessoryType) -> HNTableViewItemBuilder {
        updateOrSetConfiguration { tableViewCell in
            tableViewCell.accessoryType = accessoryType
        }
        return self
    }
    
    fileprivate func updateOrSetConfiguration(withConfiguration newConfiguration: @escaping ((HNTableViewCell) -> Void)) {
        if let previousConfiguration = configuration {
            configuration = { tableViewCell in
                previousConfiguration(tableViewCell)
                newConfiguration(tableViewCell)
            }
        } else {
            configuration = newConfiguration
        }
    }
}

//
//  HNTableViewItemBuilder.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import UIKit

class HNTableViewItemBuilder {
    
    fileprivate var type: HNTableViewCell.Type
    fileprivate var value: Any?
    fileprivate var configuration: ((HNTableViewCell) -> Void)?
    
    init(item: HNTableViewItem) {
        type = item.type
        value = item.value
        configuration = item.configuration
    }
    
    init(type: HNTableViewCell.Type, value: Any? = nil, configuration: ((HNTableViewCell) -> Void)? = nil) {
        self.type = type
        self.value = value
        self.configuration = configuration
    }
    
    func build() -> HNTableViewItem {
        return HNTableViewItem(type: type, value: value, configuration: configuration)
    }
    
    @discardableResult
    func set(value: Any?) -> HNTableViewItemBuilder {
        self.value = value
        return self
    }
    
    @discardableResult
    func set(configuration: ((HNTableViewCell) -> Void)?) -> HNTableViewItemBuilder {
        self.configuration = configuration
        return self
    }
    
    @discardableResult
    func set(accessoryType: UITableViewCellAccessoryType) -> HNTableViewItemBuilder {
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

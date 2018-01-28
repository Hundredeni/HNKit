//
//  HNTableViewController.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import UIKit

open class HNTableViewDataSource: NSObject {
    
    fileprivate var registeredReuseIdentifiers: Set<String> = []
    
    public var tableViewStructure: HNTableViewStructure
    
    public init(tableViewStructure: HNTableViewStructure = HNTableViewStructure()) {
        self.tableViewStructure = tableViewStructure
    }
}

// MARK: - UITableViewDataSource

extension HNTableViewDataSource: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewStructure.sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewStructure.sections[section].items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard tableViewStructure.containsItem(at: indexPath) else {
            return UITableViewCell()
        }
        let item = tableViewStructure[indexPath]
        if !registeredReuseIdentifiers.contains(item.type.nibReuseIdentifier) {
            tableView.register(reusableType: item.type)
            registeredReuseIdentifiers.insert(item.type.nibReuseIdentifier)
        }
        let cell = tableView.dequeue(reusableType: item.type, for: indexPath)!
        if let valueDisplayingCell = cell as? HNValueDispaying {
            valueDisplayingCell.display(value: item.value)
        }
        item.configuration?(cell)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        tableViewStructure.moveItem(from: sourceIndexPath, to: destinationIndexPath)
    }
}

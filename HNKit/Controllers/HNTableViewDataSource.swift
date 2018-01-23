//
//  HNTableViewController.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import UIKit

class HNTableViewDataSource: NSObject {
    
    fileprivate var registeredReuseIdentifiers: Set<String> = []
    
    fileprivate(set) var tableViewStructure: HNTableViewStructure?
    
    init(tableViewStructure: HNTableViewStructure?) {
        self.tableViewStructure = tableViewStructure
    }
    
    func tableViewItem(at indexPath: IndexPath) -> HNTableViewItem? {
        guard
            let tableViewStructure = tableViewStructure,
            indexPath.section < tableViewStructure.count,
            indexPath.row < tableViewStructure[indexPath.section].items.count
        else {
            return nil
        }
        return tableViewStructure[indexPath.section].items[indexPath.row]
    }
}

// MARK: - UITableViewDataSource

extension HNTableViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let tableViewStructure = tableViewStructure else {
            return 0
        }
        return tableViewStructure.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableViewStructure = tableViewStructure else {
            return 0
        }
        return tableViewStructure[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableViewItem(at: indexPath)!
        if !registeredReuseIdentifiers.contains(item.type.nibReuseIdentifier) {
            tableView.register(reusableType: item.type)
            registeredReuseIdentifiers.insert(item.type.nibReuseIdentifier)
        }
        let cell = tableView.dequeue(reusableType: item.type, for: indexPath)!
        if let valueDisplayingCell = cell as? ValueDispaying {
            valueDisplayingCell.display(value: item.value)
        }
        item.configuration?(cell)
        return cell
    }
}

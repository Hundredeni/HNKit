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
    
    var tableViewStructure: HNTableViewStructure
    
    init(tableViewStructure: HNTableViewStructure = HNTableViewStructure()) {
        self.tableViewStructure = tableViewStructure
    }
}

// MARK: - UITableViewDataSource

extension HNTableViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewStructure.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewStructure.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
}

//
//  DemoTableViewController.swift
//  HNKitDemo
//
//  Created by Lasse Hammer Priebe on 28/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import UIKit
import HNKit

class DemoTableViewController: UITableViewController {
    
    fileprivate let demoDataSource = DemoTableViewDataSource(numberOfSections: 5, numberOfRowsPerSection: 5)
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
        tableView.dataSource = demoDataSource
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if proposedDestinationIndexPath.section == sourceIndexPath.section {
            return proposedDestinationIndexPath
        } else if proposedDestinationIndexPath.section > sourceIndexPath.section {
            return IndexPath(row: demoDataSource.tableViewStructure.sections[sourceIndexPath.section].items.count - 1, section: sourceIndexPath.section)
        } else {
            return IndexPath(row: 0, section: sourceIndexPath.section)
        }
    }
}

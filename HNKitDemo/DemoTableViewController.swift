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
    
    fileprivate let demoDataSource = DemoTableViewDataSource(usingBuilder: false)
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = demoDataSource
    }
}

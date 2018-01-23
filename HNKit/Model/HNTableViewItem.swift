//
//  HNTableViewItem.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import UIKit

struct HNTableViewItem {
    let type: HNTableViewCell.Type
    let value: Any?
    let configuration: ((HNTableViewCell) -> Void)?
}

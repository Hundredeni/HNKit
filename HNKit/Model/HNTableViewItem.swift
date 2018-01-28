//
//  HNTableViewItem.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import UIKit

public struct HNTableViewItem {
    
    public let type: HNTableViewCell.Type
    public let value: Any?
    public let identifier: String?
    public let configuration: ((HNTableViewCell) -> Void)?
    
    public init(type: HNTableViewCell.Type = HNTableViewCell.self, value: Any? = nil, identifier: String? = nil, configuration: ((HNTableViewCell) -> Void)? = nil) {
        self.type = type
        self.value = value
        self.identifier = identifier
        self.configuration = configuration
    }
}

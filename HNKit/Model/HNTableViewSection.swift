//
//  HNTableViewSection.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 23/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import Foundation

public struct HNTableViewSection {
    
    public var items: [HNTableViewItem]
    public var headerTitle: String?
    public var footerTitle: String?
    public var identifier: String?
    
    public init(items: [HNTableViewItem] = [], headerTitle: String? = nil, footerTitle: String? = nil, identifier: String? = nil) {
        self.items = items
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.identifier = identifier
    }
}

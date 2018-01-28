//
//  DemoTableViewCell.swift
//  HNKitDemo
//
//  Created by Lasse Hammer Priebe on 28/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import HNKit

class DemoTableViewCell: HNTableViewCell {
    
    override func prepareForReuse() {
        textLabel?.text = nil
    }
}

extension DemoTableViewCell: HNValueDispaying {
    
    func display(value: Any?) {
        textLabel?.text = value as? String
    }
}

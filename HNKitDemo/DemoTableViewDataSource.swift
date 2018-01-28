//
//  DemoTableViewDataSource.swift
//  HNKitDemo
//
//  Created by Lasse Hammer Priebe on 28/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import HNKit

class DemoTableViewDataSource: HNTableViewDataSource {
    
    init(numberOfSections: Int, numberOfRowsPerSection: Int) {
        
        var sections = [HNTableViewSection]()
        
        for sectionNumber in 0..<numberOfSections {
            
            var section = HNTableViewSection()
            
            for rowNumber in 0..<numberOfRowsPerSection {
                
                section.items.append(HNTableViewItem(type: DemoTableViewCell.self, value: "Section: \(sectionNumber); Row: \(rowNumber)."))
            }
            
            sections.append(section)
        }
        
        super.init(tableViewStructure: HNTableViewStructure(sections: sections))
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

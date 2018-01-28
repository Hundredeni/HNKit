//
//  DemoTableViewDataSource.swift
//  HNKitDemo
//
//  Created by Lasse Hammer Priebe on 28/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import HNKit

class DemoTableViewDataSource: HNTableViewDataSource {
    
    init(usingBuilder: Bool) {

        let animals = ["Bird", "Cat", "Dog"]
        let phones = ["iPhone 7", "iPhone 8", "iPhone X"]
        
        if usingBuilder {
            
            // Demo creating HNTableViewStructure using HNTableViewStructureBuilder
            
            let builder = HNTableViewStructureBuilder()

            builder
                .addSectionUsingBuilder({ sectionBuilder in
                    sectionBuilder
                        .set(headerTitle: "Animals")
                        .addItems(animals.map { HNTableViewItem(type: DemoTableViewCell.self, value: $0) })
                })
                .addSectionUsingBuilder({ sectionBuilder in
                    sectionBuilder
                        .set(headerTitle: "Phones")
                        .addItems(phones.map { HNTableViewItem(type: DemoTableViewCell.self, value: $0) })
                })
            
            super.init(tableViewStructure: builder.build())
        
        } else {
            
            // Demo creating HNTableViewStructure without using HNTableViewStructureBuilder
            
            let sectionData = [(title: "Animals", values: animals), (title: "Phones", values: phones)]
            let sections = sectionData.map {
                section in HNTableViewSection(items: section.values.map {
                    item in HNTableViewItem(type: DemoTableViewCell.self, value: item)
                }, headerTitle: section.title)
            }
            super.init(tableViewStructure: HNTableViewStructure(sections: sections))
        }
    }
}

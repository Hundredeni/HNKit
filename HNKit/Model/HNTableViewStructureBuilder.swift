//
//  HNTableViewStructureBuilder.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 28/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import Foundation

class HNTableViewStructureBuilder {
    
    fileprivate var sections: [HNTableViewSection]
    
    init(structure: HNTableViewStructure) {
        sections = structure.sections
    }
    
    init(sections: [HNTableViewSection] = []) {
        self.sections = sections
    }
    
    func build() -> HNTableViewStructure {
        return HNTableViewStructure(sections: sections)
    }
    
    @discardableResult
    func append(_ section: HNTableViewSection) -> HNTableViewStructureBuilder {
        sections.append(section)
        return self
    }
    
    @discardableResult
    func append(contentsOf sections: [HNTableViewSection]) -> HNTableViewStructureBuilder {
        self.sections.append(contentsOf: sections)
        return self
    }
    
    @discardableResult
    func insert(_ section: HNTableViewSection, at index: Int) -> HNTableViewStructureBuilder {
        sections.insert(section, at: index)
        return self
    }
    
    @discardableResult
    func insert(contentsOf sections: [HNTableViewSection], at index: Int) -> HNTableViewStructureBuilder {
        self.sections.insert(contentsOf: sections, at: index)
        return self
    }
    
    @discardableResult
    func prepend(_ section: HNTableViewSection) -> HNTableViewStructureBuilder {
        return insert(section, at: 0)
    }
    
    @discardableResult
    func prepend(contentsOf sections: [HNTableViewSection]) -> HNTableViewStructureBuilder {
        return insert(contentsOf: sections, at: 0)
    }
}

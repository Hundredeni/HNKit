//
//  HNTableViewStructureBuilder.swift
//  HNKit
//
//  Created by Lasse Hammer Priebe on 28/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import Foundation

open class HNTableViewStructureBuilder {
    
    fileprivate var sections: [HNTableViewSection]
    
    public init(sections: [HNTableViewSection] = []) {
        self.sections = sections
    }
    
    open func build() -> HNTableViewStructure {
        return HNTableViewStructure(sections: sections)
    }
    
    @discardableResult
    public func addSection(_ section: HNTableViewSection) -> HNTableViewStructureBuilder {
        sections.append(section)
        return self
    }
    
    @discardableResult
    public func addSections(_ sections: [HNTableViewSection]) -> HNTableViewStructureBuilder {
        self.sections.append(contentsOf: sections)
        return self
    }

    @discardableResult
    public func addSectionUsingBuilder(_ builderBlock: ((HNTableViewSectionBuilder) -> Void)?) -> HNTableViewStructureBuilder {
        let builder = HNTableViewSectionBuilder()
        builderBlock?(builder)
        let section = builder.build()
        return addSection(section)
    }
}

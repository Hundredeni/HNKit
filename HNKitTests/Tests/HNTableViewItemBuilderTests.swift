//
//  HNTableViewItemBuilderTests.swift
//  HNKitTests
//
//  Created by Lasse Hammer Priebe on 28/01/2018.
//  Copyright © 2018 Hundredeni. All rights reserved.
//

import XCTest
@testable import HNKit

class HNTableViewItemBuilderTests: XCTestCase {
    
    func testInit_typeProvided_sameTypeIncludedInBuild() {
        
        let testType = MockHNTableViewCell.self
        
        let builder = HNTableViewItemBuilder(type: testType)
        let item = builder.build()
        
        XCTAssert(item.type == MockHNTableViewCell.self)
    }
    
    func testInit_valueProvided_sameValueIncludedInBuild() {
        
        let testValue = 1
        
        let builder = HNTableViewItemBuilder(type: HNTableViewCell.self, value: testValue)
        let item = builder.build()
        
        let resultValue = item.value as? Int
        XCTAssertNotNil(resultValue)
        XCTAssertEqual(resultValue!, testValue)
    }
    
    func testInit_configurationProvided_sameConfigurationIncludedInBuild() {
        
        let testTagValue = 1
        let testConfiguration: ((HNTableViewCell) -> Void) = { tableViewCell in
            tableViewCell.tag = testTagValue
        }
        let testTableViewCell = HNTableViewCell()
        
        let builder = HNTableViewItemBuilder(type: HNTableViewCell.self, value: nil, configuration: testConfiguration)
        let item = builder.build()
        
        XCTAssertNotNil(item.configuration)
        item.configuration?(testTableViewCell)
        XCTAssertEqual(testTableViewCell.tag, testTagValue)
    }

    func testSetValue_valueSet_sameValueIncludedInBuild() {
        
        let testValue = 1
        
        let builder = HNTableViewItemBuilder(type: HNTableViewCell.self)
        builder.set(value: testValue)
        let item = builder.build()

        let resultValue = item.value as? Int
        XCTAssertNotNil(resultValue)
        XCTAssertEqual(resultValue!, testValue)
    }
    
    func testSetConfiguration_configurationSet_sameConfigurationIncludedInBuild() {
        
        let testTagValue = 1
        let testConfiguration: ((HNTableViewCell) -> Void) = { tableViewCell in
            tableViewCell.tag = testTagValue
        }
        let testTableViewCell = HNTableViewCell()
        
        let builder = HNTableViewItemBuilder(type: HNTableViewCell.self)
        builder.set(configuration: testConfiguration)
        let item = builder.build()
        
        XCTAssertNotNil(item.configuration)
        item.configuration?(testTableViewCell)
        XCTAssertEqual(testTableViewCell.tag, testTagValue)
    }
    
    func testSetAccessoryType_accessoryTypeSet_sameAccessoryTypeIncludedInConfigurationOnBuild() {
        
        let testAccessoryType = UITableViewCellAccessoryType.disclosureIndicator
        let testTableViewCell = HNTableViewCell()
        
        let builder = HNTableViewItemBuilder(type: HNTableViewCell.self)
        builder.set(accessoryType: testAccessoryType)
        let item = builder.build()
        
        XCTAssertNotNil(item.configuration)
        item.configuration?(testTableViewCell)
        XCTAssertEqual(testTableViewCell.accessoryType, testAccessoryType)
    }
}


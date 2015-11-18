//
//  SwiftVendingMachineTests.swift
//  SwiftVendingMachineTests
//
//  Created by Mike Mueller on 11/18/15.
//  Copyright © 2015 Mike Mueller. All rights reserved.
//

import XCTest
@testable import SwiftVendingMachine

class SwiftVendingMachineTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func inputPennyGetsInvalidCoin() {
        // Setup
        let machine = Machine()
        let expectedValue: String = "Invalid Coin"
        
        // Action
        let result: String = machine.readCoin(CoinSizeEnum.penny, CoinWeightEnum.penny)
        
        // Assert
        XCTAssertEqual(result, expectedValue)
    }
    
    
}
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
    private var machine: Machine!
    
    override func setUp() {
        super.setUp()
        machine = Machine()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInputPennyGetsInvalidCoin() {
        // Setup
        let expectedValue: String = "Invalid Coin"
        
        // Action
        let result: String = machine.readCoin(CoinSizeEnum.penny, coinweight: CoinWeightEnum.penny)
        
        // Assert
        XCTAssertEqual(result, expectedValue)
    }
    
    func testInputNickelGetsFiveCents() {
        //Setup
        let expectedValue: String = ".05"
        
        //Action
        let result: Int = machine.readCoin(CoinSizeEnum.nickel, coinweight: CoinWeightEnum.penny)
        
        //Assert
        XCTAssertEqual(result, expectedValue)
        
    }
    
    
}
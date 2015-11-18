// Setup

// Action

// Assert

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
        
        // Action
        let result: Int? = machine.readCoin("penny", coinweight: "penny")
        
        // Assert
        XCTAssertEqual(result, nil)
    }
    
    func testInputNickelGetsFiveCents() {
        //Setup
        let expectedValue: Int = 5
        
        //Action
        let result: Int? = machine.readCoin("nickel", coinweight: "nickel")
        
        //Assert
        XCTAssertEqual(result, expectedValue)
    }
    
    func testInputDimeGetsTenCents() {
        // Setup
        let expectedValue: Int = 10
        
        // Action
        let result: Int? = machine.readCoin("dime", coinweight: "dime")
        
        // Assert
        XCTAssertEqual(result, expectedValue)
    }
    
    func testInputQuarterGetsTwentyFiveCents() {
        // Setup
        let expectedValue: Int = 25
        
        // Action
        let result: Int? = machine.readCoin("quarter", coinweight: "quarter")
        
        print(expectedValue)
        
        // Assert!
        XCTAssertEqual(result, expectedValue)
    }
    
    // INPUT TESTS
    
    func testInputNickelAddsFiveCentsToTotal() {
        // Setup
        let expectedValue: Int = 5
    
        // Action
        let result: Int? = machine.insertCoin("nickel")
    
        // Assert
    
        XCTAssertEqual(result, expectedValue)
    }
    
    func testInputTwoNickelsAddsTenCentsToTotal() {
        // Setup
        let expectedValue: Int = 10
        
        // Action
        var result: Int? = machine.insertCoin("nickel")
        result = machine.insertCoin("nickel")
        
        // Assert
        
        XCTAssertEqual(result, expectedValue)
    }
    
    func testInputThreeDimesAddsThirtyCentsToTotal() {
        // Setup
        let expectedValue: Int = 30
        
        // Action
        var result: Int? = machine.insertCoin("dime")
        result = machine.insertCoin("dime")
        result = machine.insertCoin("dime")
        
        // Assert
        
        XCTAssertEqual(result, expectedValue)
    }
    
    func testInputTwoQuartersOneDimeOneNickelAddsSixtyFiveToTotal() {
        // Setup
        let expectedValue: Int = 65
        
        // Action
        var result: Int? = machine.insertCoin("quarter")
        result = machine.insertCoin("quarter")
        result = machine.insertCoin("dime")
        result = machine.insertCoin("nickel")
        
        // Assert
        
        XCTAssertEqual(result, expectedValue)
        
    }
    
    func testInputOneQuartersOnePennyOneNickelAddsThirtyToTotal() {
        // Setup
        let expectedValue: Int = 30
        
        // Action
        var result: Int? = machine.insertCoin("quarter")
        result = machine.insertCoin("penny")
        result = machine.insertCoin("nickel")
        
        // Assert
        
        XCTAssertEqual(result, expectedValue)
        
    }
    
    //PRODUCT TESTS
    
    func testBalanceTooLowDisplaysProductPriceForCola() {
        // Setup
        let expectedValue: String = "PRICE: 100 cents"
        
        // Action
        var result: String? = machine.purchase("cola")
        
        // Assert
        
        XCTAssertEqual(result, expectedValue)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
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
    
    //QUESTION, is this the best way to test for nill and should I use ! or?
    func testInputPennyGetsInvalidCoin() {
        // Setup
        let expectedValue: String! = nil
        
        // Action
        let result: NSDecimalNumber? = machine.readCoin("penny", coinweight: "penny")
        
        // Assert
        XCTAssertEqual(result, expectedValue)
    }
    
    func testInputNickelGetsFiveCents() {
        //Setup
        let expectedValue: NSDecimalNumber = 0.05
        
        //Action
        let result: NSDecimalNumber? = machine.readCoin("nickel", coinweight: "nickel")
        
        //Assert
        XCTAssertEqual(result, expectedValue)
    }
    
    func testInputDimeGetsTenCents() {
        // Setup
        let expectedValue: NSDecimalNumber = 0.10
        
        // Action
        let result: NSDecimalNumber? = machine.readCoin("dime", coinweight: "dime")
        
        // Assert
        XCTAssertEqual(result, expectedValue)
    }
    
    
    
    
}
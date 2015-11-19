// Setup

// Action

// Assert

import XCTest
@testable import SwiftVendingMachine

class SwiftVendingMachineTests: XCTestCase {
    var machine: Machine!
    
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
        let coin = Coin(type: CoinType.PENNY)
        
        // Action
        let result: Bool? = machine.insertCoin(coin)
        
        // Assert
        XCTAssertEqual(result, false)
    }
    
    func testInputDimeIsValidCoin() {
        // Setup
        let coin = Coin(type: CoinType.DIME)
        
        // Action
        let result: Bool = machine.insertCoin(coin)
        
        // Assert
        XCTAssertEqual(result, true)
    }
    
    func testInputNickelIsValidCoin() {
        // Setup
        let coin = Coin(type: CoinType.NICKEL)
        
        // Action
        let result: Bool = machine.insertCoin(coin)
        
        // Assert
        XCTAssertEqual(result, true)
    }
    
    func testInputQuarterIsValidCoin() {
        // Setup
        let coin = Coin(type: CoinType.QUARTER)
        
        // Action
        let result: Bool = machine.insertCoin(coin)
        
        // Assert
        XCTAssertEqual(result, true)
    }
    
    func testInputDimeGetsTenCents() {
        // Setup
        let expectedValue: Int = 10
        let coin = Coin(type: CoinType.DIME)
        
        // Action
        machine.insertCoin(coin)
        
        // Assert
        let result: Int = machine.totalBalance
        XCTAssertEqual(result, expectedValue)
    }
    
    func testInputQuarterGetsTwentyFiveCents() {
        // Setup
        let expectedValue: Int = 25
        let coin = Coin(type: CoinType.QUARTER)
        
        // Action
        machine.insertCoin(coin)
        
        // Assert!
        let result: Int = machine.totalBalance
        XCTAssertEqual(result, expectedValue)
    }
    
    
    // INPUT TESTS
    
    func testInputNickelAddsFiveCentsToTotal() {
        // Setup
        let expectedValue: Int = 5
        let coin = Coin(type: CoinType.NICKEL)
    
        // Action
        machine.insertCoin(coin)
    
        // Assert
        let result: Int = machine.totalBalance
        XCTAssertEqual(result, expectedValue)
    }
    
    
    func testInputTwoNickelsAddsTenCentsToTotal() {
        // Setup
        let expectedValue: Int = 10
        let coin = Coin(type: CoinType.NICKEL)
        
        // Action
        machine.insertCoin(coin)
        machine.insertCoin(coin)
        
        // Assert
        let result: Int = machine.totalBalance
        XCTAssertEqual(result, expectedValue)
    }
    
    
    func testInputThreeDimesAddsThirtyCentsToTotal() {
        // Setup
        let expectedValue: Int = 30
        let coin = Coin(type: CoinType.DIME)
        
        // Action
        machine.insertCoin(coin)
        machine.insertCoin(coin)
        machine.insertCoin(coin)
        
        // Assert
        let result: Int = machine.totalBalance
        XCTAssertEqual(result, expectedValue)
    }
    
   
    func testInputTwoQuartersOneDimeOneNickelAddsSixtyFiveToTotal() {
        // Setup
        let expectedValue: Int = 65
        let coinDime = Coin(type: CoinType.DIME)
        let coinNickel = Coin(type: CoinType.NICKEL)
        let coinQuarter = Coin(type: CoinType.QUARTER)
        
        // Action
        machine.insertCoin(coinQuarter)
        machine.insertCoin(coinQuarter)
        machine.insertCoin(coinDime)
        machine.insertCoin(coinNickel)
        
        // Assert
        let result: Int = machine.totalBalance
        XCTAssertEqual(result, expectedValue)
        
    }
    
    
    func testInputOneQuartersOnePennyOneNickelAddsThirtyToTotal() {
        // Setup
        let expectedValue: Int = 30
        let coinPenny = Coin(type: CoinType.PENNY)
        let coinNickel = Coin(type: CoinType.NICKEL)
        let coinQuarter = Coin(type: CoinType.QUARTER)
        
        // Action
        machine.insertCoin(coinQuarter)
        machine.insertCoin(coinPenny)
        machine.insertCoin(coinNickel)
        
        // Assert
        let result: Int = machine.totalBalance
        XCTAssertEqual(result, expectedValue)
        
    }
    
    
    //PRODUCT TESTS
    
    func testBalanceTooLowDisplaysProductPriceForCola() {
        // Setup
        
        // Action
        let result: Bool = machine.purchase(ProductEnum.COLA)
        
        // Assert
        
        XCTAssertEqual(result, false)
    }
    
    
    
    
    func testBalanceTooLowDisplaysProductPriceForCandy() {
        // Setup
        TestUtils.createBeginningBalance(63, machine: machine)
        
        // Action
 
        let purchaseResult: Bool = machine.purchase(ProductEnum.CANDY)
        
        // Assert
        
        XCTAssertEqual(purchaseResult, false)
    }
    
    func testBalanceExactForCandyAllowsPurchase() {
        // Setup
        TestUtils.createBeginningBalance(65, machine: machine)
        
        // Action
        
        let purchaseResult: Bool = machine.purchase(ProductEnum.CANDY)
        
        // Assert
        
        XCTAssertEqual(purchaseResult, true)
    }
    
    
    
    func testEnoughCentsInsertedCorrectChangeIsMade() {
        // Setup
        let extraBalance : Int = 40
        let theProductPrice: Int = ProductEnum.CANDY.rawValue
        let totalBalanceToInsert: Int = theProductPrice + extraBalance
        TestUtils.createBeginningBalance(totalBalanceToInsert, machine: machine)
        
        //let expectedReturnValue: String = "Success"
        let expectedBalance: Int = extraBalance
        
        // Action
        let purchaseReturnValue: Bool = machine.purchase(ProductEnum.CANDY)
        
        // Assert
        XCTAssertEqual(purchaseReturnValue, true)
        XCTAssertEqual(machine.totalBalance, expectedBalance)
    }
    
    
    
    func testMachineHasCorrectBalanceInInsertCoinSlotWhenTheBalanceIsSufficientForItemPurchase() {
        // Setup
        let theProductPrice: Int = ProductEnum.COLA.rawValue
        let productEnumName : ProductEnum = ProductEnum.COLA
        let machineBalanceExpected : Int = 40
        let balanceToInsertIntoCoinSlot: Int = theProductPrice + machineBalanceExpected

        // Prep the machine with enough balance for change..
        TestUtils.createBeginningBalance(balanceToInsertIntoCoinSlot, machine: machine)

        // Action
        machine.purchase(productEnumName)
        

        // Assert
        let resultBalance = machine.totalBalance
        XCTAssertEqual(resultBalance, machineBalanceExpected)
    }
    
    func testMachineHasCorrectBalanceInInsertCoinSlotWhenTheBalanceIsNotSufficientForItemPurchase() {
        // Setup
        let theProductPrice: Int = ProductEnum.COLA.rawValue
        let productEnumName : ProductEnum = ProductEnum.COLA
        let balanceToInsertIntoCoinSlot: Int = TestUtils.givenProductPriceDecrementby5(theProductPrice)
        let machineBalanceExpected : Int = balanceToInsertIntoCoinSlot
        
        // Prep the machine with enough balance for change..
        TestUtils.createBeginningBalance(balanceToInsertIntoCoinSlot, machine: machine)
        
        // Action
        machine.purchase(productEnumName)
        
        
        // Assert
        let resultBalance = machine.totalBalance
        XCTAssertEqual(resultBalance, machineBalanceExpected)
    }
    

}

import XCTest
@testable import SwiftVendingMachine


class FirstViewControllerTests: XCTestCase {
    private var _subject : SwiftVendingMachine.FirstViewController!
    private var _view : UIView!
    
    override func setUp() {
        super.setUp()
        
        let storyboard : UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        _subject = storyboard.instantiateViewControllerWithIdentifier("FirstViewController") as! SwiftVendingMachine.FirstViewController
        _view = _subject.view // Prevents view from being immediately garbage collected...
    }
    
    override func tearDown() {
        super.tearDown()
    }
    


    func testPennyButtonPressedInsertsPennyIntoMachine() {
        // Setup
        let mockMachine : MockMachine = MockMachine()
        _subject._machine = mockMachine

        // Action
        _subject.pennyButton.sendActionsForControlEvents(UIControlEvents.TouchUpInside)

        // Assert
        let invocationCount : Int = mockMachine._mocker.getInvocationCountFor("insertCoin")
        XCTAssertEqual(invocationCount, 1, "machine.insertCoin was not invoked after pressing penny button.")
        let insertCoinParameters : Mocker.ParamList_t = mockMachine._mocker.getParametersFor("insertCoin")!
        XCTAssertEqual((insertCoinParameters[0] as! Coin).coinType, CoinType.PENNY, "FirstViewController.pennyButton does not insert a penny when clicked.")
    }
}
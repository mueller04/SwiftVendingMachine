
import Foundation
@testable import SwiftVendingMachine

class MockMachine : SwiftVendingMachine.Machine {
    let _mocker : Mocker = Mocker()

    override func insertCoin(coin: SwiftVendingMachine.Coin) -> Bool {
        _mocker.recordInvocation("insertCoin", paramList: [coin])
        return _mocker.getReturnValueFor("insertCoin") as! Bool
    }
}
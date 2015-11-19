import Foundation

class TestUtils {
    
    static func givenProductPriceIncrementBalanceBy(price: Int) -> Int {
        return price + 40
    }
    
    static func givenProductPriceDecrementby5 (price: Int) -> Int {
        return price - 5
    }
    
    static func createBeginningBalance(insertedBalance: Int, machine: Machine) {
        machine.totalBalance = insertedBalance
    }
    
    
}
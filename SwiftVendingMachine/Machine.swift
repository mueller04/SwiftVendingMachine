import Foundation

public class Machine {
    var totalBalance: Int = 0
    var coinsSlotRepo = [Coin]()

    
    public func insertCoin(coin: Coin) -> Bool {
        
        if (coin.value == 1) {
            return false
        } else {
            // coinsSlotRepo.append(coin) // TODO: Test Me
            totalBalance += coin.value
            return true 
        }
    }
    
    
    func purchase(product: ProductEnum) -> Bool {
        if (product.rawValue > totalBalance) {
            return false
        } else {
            totalBalance -= product.rawValue
            return true
        }
    }
}

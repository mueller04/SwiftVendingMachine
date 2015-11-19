import Foundation

public class Machine {
    var totalBalance: Int = 0
    var coinsSlotRepo = [Coin]()

    
    public func insertCoin(coin: Coin) -> Bool? {
        
        if (coin.value == 1) {
            return false
        } else {
            coinsSlotRepo.append(coin)
            totalBalance += coin.value
            return true
        }
    }
    
    
    func purchase(product: ProductEnum) -> String {
        
        if (product.rawValue > totalBalance){
            
            return ("PRICE: \(product.rawValue) cents")
        } else {
            totalBalance -= product.rawValue
            return "Success"
        }
    }
}

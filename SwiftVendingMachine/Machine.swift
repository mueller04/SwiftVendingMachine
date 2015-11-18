import Foundation

class Machine {
    var totalBalance: Int = 0
    
    let products = [
        "cola" : 100,
        "chips" : 50,
        "candy" : 65
    ]
    
    func readCoin(coinsize: String, coinweight: String) -> Int? {
        
        if (coinsize == CoinSizeEnum.nickel.rawValue && coinweight == CoinWeightEnum.nickel.rawValue) {
            return 5
        } else if (coinsize == CoinSizeEnum.dime.rawValue && coinweight == CoinWeightEnum.dime.rawValue) {
            return 10
        } else if ((coinsize == CoinSizeEnum.quarter.rawValue && coinweight == CoinWeightEnum.quarter.rawValue)) {
            return 25
        } else {
            return nil
        }
    }
    
    func insertCoin(coin: String) -> Int? {
        var calculatedTotal: Int? = readCoin(coin, coinweight: coin)
        
        if (calculatedTotal != nil) {
            totalBalance += calculatedTotal!
        }
        return totalBalance
    }
    
    func purchase(product: String) -> String {
        
        if (products[product] > totalBalance) {
            return ("PRICE: \(products[product]!) cents")
        } else {
            totalBalance -= products[product]!
            return "Success"
        }
        
        
        
    }
    
}

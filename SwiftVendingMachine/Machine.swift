import Foundation

class Machine {
    
    func readCoin(coinsize: String, coinweight: String) -> NSDecimalNumber? {
        
        if (coinsize == CoinSizeEnum.nickel.rawValue && coinweight == CoinSizeEnum.nickel.rawValue) {
            return 0.05
        } else {
            return nil
        }
        
        
    }
}

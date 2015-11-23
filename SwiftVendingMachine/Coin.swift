import Foundation

class Coin {
    let value: Int
    let coinType: CoinType
    
     init(type: CoinType) {
        value = type.rawValue
        coinType = type
    }
    
}
    
    //static func makeCoin(type : CoinType) -> Coin {
    //switch (type) {
        //case CoinType.QUARTER {
            //return Coin(type: CoinType)
    //} break;
    //case Types.NICKEL
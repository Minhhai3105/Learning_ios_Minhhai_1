import Foundation
// Kho hang va giam gia
struct Product {
    let name: String
    let price: Double
}

protocol Pricable {
    var price: Double { get }
    
    
}
extension Product: Pricable {} 

extension Pricable {
    func priceAfter(percent: Double) -> Double {
        return price-price*percent/100
    }
}
let product1 = Product(name: "11prm", price: 100)
let product2 = Product(name: "15prm", price: 1000)

print("Giá sau khi giảm: ", product1.priceAfter(percent: 15))
print("Giá sau khi giảm: ", product2.priceAfter(percent: 50))


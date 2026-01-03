let prices = [10.0, 25.5, 4.5]

func totalPrice(of prices: [Double], taxRate: Double = 0.1, discount: Double? = 0) -> Double {
    
    var total: Double = 0
    for price in prices {
        total += price
    }
    let tax = total * taxRate
    
    let discount = total * discount!
    
    return total + tax - discount
    
}
print(totalPrice(of: prices)) 
print(totalPrice(of: prices, discount: 0.2))

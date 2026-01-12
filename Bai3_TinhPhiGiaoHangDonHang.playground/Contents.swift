enum ShippingMethod {
    case standard
    case express
    case sameDay(distanceKm : Int)
}
func calculateShippingFee(method: ShippingMethod, orderAmount: Double) -> Double {
    if orderAmount >= 10000000 {
        return 0
    }
    switch method {
        case .standard:
            return 20000
        case .express:
            return 40000
        case sameDay(let distanceKm):
            if distanceKm <= 5 {
                return 50000
            } else {
                let extraDistance = distanceKm - 5
                return 50000 + Double(extraDistance) *5_000
            }
    }
}

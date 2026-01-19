struct OrderService {
    func validateOrder(_ order: Order?) -> OrderStatus {
        if let order = order {
            if order.products.isEmpty {
                return .orderEmpty
            } else {
                return .orderValid
            }
        } else {
            return .orderEmpty
        }

    }

    func calculateTotalPrice(
        products: [Product],
        onResult: (TotalPriceStatus, Double?) -> Void
    ) {
        if products.contains(where: { $0.price < 0 }) {
            onResult(.priceInvalid, nil)
            return
        }

        let total = products.map { $0.price }.reduce(0, +)
        onResult(.priceOK, total)
    }

    func validate(order: Order) -> OrderStatus {
        validateOrder(order)
    }

    func totalPrice(products: [Product]) -> Double {
        var result: Double = 0
        calculateTotalPrice(products: products) { status, total in

            if status == .priceOK, let total = total {
                result = total
            } else {
                result = 0
            }
        }
        return result
    }

}

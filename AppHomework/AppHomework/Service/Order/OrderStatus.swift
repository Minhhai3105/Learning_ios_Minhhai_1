enum OrderStatus {
    case orderEmpty
    case orderValid

    var message: String {
        switch self {
        case .orderEmpty:
            return "Đơn hàng rỗng"
        case .orderValid:
            return "Đơn hàng hợp lệ"
        }
    }
}

enum TotalPriceStatus {
    case priceInvalid
    case priceOK

    var message: String {
        switch self {
        case .priceInvalid:
            return "Giá sản phẩm không hợp lệ"
        case .priceOK:
            return "Tính tiền thành công"
        }
    }
}

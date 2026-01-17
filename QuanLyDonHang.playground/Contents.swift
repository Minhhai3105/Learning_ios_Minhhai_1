import Foundation

struct User {
    let id: Int
    let name: String
    let isActive: Bool
}

struct Product {
    let id: Int
    let name: String
    let price: Double
}

struct Order {
    let orderId: Int
    let userId: Int
    let products: [Product]
}

enum UserStatus {
    case usernotFound
    case userInactive
    case userActive

    var message: String {
        switch self {
        case .usernotFound:
            return "Không tìm thấy user"
        case .userInactive:
            return "User bị khóa"
        case .userActive:
            return "User hợp lệ"
        }
    }
}

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

enum PaymentStatus {
    case success
    case failed
    case invalid

    var message: String {
        switch self {
        case .success:
            return "Thanh toán thành công"
        case .failed:
            return "Thanh toán thất bại"
        case .invalid:
            return "Thanh toán không hợp lệ"
        }
    }
}

enum SearchOrderStatus {
    case emptyKeyword
    case found
    case notFound

    var message: String {
        switch self {
        case .emptyKeyword:
            return "Từ khóa rỗng"
        case .found:
            return "Tìm thấy đơn hàng"
        case .notFound:
            return "Không tìm thấy đơn hàng"
        }
    }
}

func checkUser(users: [User], userId: Int) -> UserStatus {
    let user = users.first { $0.id == userId }

    if user == nil {
        return .usernotFound
    }
    if user!.isActive {
        return .userActive
    } else {
        return .userInactive
    }
}

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

func payment(total: Double?) -> PaymentStatus {
    guard let total = total, total > 0 else {
        return .invalid
    }
    return total <= 1_000_000 ? .success : .failed
}

func searchOrderByProductName(keyword: String?, orders: [Order])
    -> SearchOrderStatus
{
    if let keyword = keyword, !keyword.isEmpty {
        let lowerKeyword = keyword.lowercased()
        for oder in orders {
            for product in oder.products {
                if product.name.lowercased().contains(lowerKeyword) {
                    return .found
                }

            }
        }
        return .notFound
    } else {
        return .emptyKeyword
    }

}

enum Screen {
    case login
    case orderList
    case orderDetail
    case payment
}

struct UiState {
    let screen: Screen
    let status: String
    let message: String
}

func UIStatus(Search: SearchOrderStatus) -> UiState {
    switch Search {
    case .emptyKeyword:
        return UiState(
            screen: .orderList,
            status: "error",
            message: Search.message
        )
    case .found:
        return UiState(
            screen: .orderDetail,
            status: "Success",
            message: Search.message
        )
    case .notFound:
        return UiState(
            screen: .orderList,
            status: "empty",
            message: Search.message
        )
    }
}

let users = [
    User(id: 1, name: "Hải", isActive: true),
    User(id: 2, name: "Hoa", isActive: false),
    User(id: 3, name: "Tuấn", isActive: true),

]

let productA = Product(id: 1, name: "iPhone", price: 20_000_000)
let productB = Product(id: 2, name: "AirPods", price: 5_000_000)
let productInvalid = Product(id: 3, name: "Fake", price: -100_000)
let validOrder = Order(orderId: 1, userId: 1, products: [productA, productB])
let emptyOrder = Order(orderId: 2, userId: 1, products: [])
let orders = [validOrder, emptyOrder]

print("\nUserStatus: ")
print(checkUser(users: users, userId: 1).message)

print("\nOrderStatus: ")
print(validateOrder(validOrder).message)

print("\nTotalPriceStatus: ")
calculateTotalPrice(products: validOrder.products) { status, total in
    print(status.message)

    print("\nPaymentStatus: ")
    print(payment(total: total).message)
}

print("\nOrderStatus: ")
print(validateOrder(emptyOrder).message)

print("\nTotalPriceStatus")
calculateTotalPrice(products: [productInvalid]) { status, _ in
    print(status.message)
}

print("\nPaymentStatus")
print(payment(total: 2_000_000).message)

print("\nTìm kiếm keyword")
print(searchOrderByProductName(keyword: nil, orders: orders).message)
print(searchOrderByProductName(keyword: "iphone", orders: orders).message)
print(searchOrderByProductName(keyword: "macbook", orders: orders).message)

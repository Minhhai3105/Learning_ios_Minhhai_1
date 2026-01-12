import Foundation
// Hệ thống thanh toán
struct Order {
    var id: Int
    var amount: Double
}

enum PaymentStatus {
    case success
    case failed(reason: String)
}

protocol PaymentMethod {
    var id: Int { get } 
    var amount: Double { get }
    func pay(order: Order) -> PaymentStatus
}

extension PaymentMethod {
    func printPayment(order: Order) {
        let status =  pay(order: order)
        switch status {
        case .success:
            print("Thanh toan thanh cong \(order.id)")
        case .failed(let reason):
            print("Thanh toan that bai  \(reason)")
        }
    }
}
struct CashPayment: PaymentMethod {
    let id : Int
    let amount : Double
    let limit : Double
    
    func pay(order: Order) -> PaymentStatus {
        guard order.amount <= amount else {
            return .failed(reason: "Không đủ số dư")
        }
        return .success
    }
}
let order = Order(id: 1, amount: 500000)
let cash1 = CashPayment(id: 101, amount: 500000, limit: 1000000)
cash1.printPayment(order: order)

let cash2 = CashPayment(id: 102, amount: 500000, limit: 300000)
cash2.printPayment(order: order)



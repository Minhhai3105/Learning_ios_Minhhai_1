import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let products = [
            Product(id: 1, name: "Hải", price: 1000),
            Product(id: 2, name: "Tuấn", price: 550_000),
        ]
        let order = Order(orderId: 1, userId: 1, products: products)

        let orderService = OrderService()
        let paymentService = PaymentService()

        print(orderService.validate(order: order).message)

        let total = orderService.totalPrice(products: products)
        print("Total:", total)
        print(paymentService.payment(total: total).message)

        let amount: Double = 250_000

        let status = paymentService.pay(amount: amount)

        print(status.message)

        let products1 = [
            Product(id: 1, name: "Hải", price: 20_000_000),
            Product(id: 2, name: "Tuấn", price: 5_000_000),
        ]

        let products2 = [
            Product(id: 3, name: "Nam", price: 200_000)
        ]

        

        let orders = [
            Order(orderId: 1, userId: 1, products: products1),
            Order(orderId: 2, userId: 2, products: products2),
        ]

        let users = [
            User(id: 1, name: "Hải", isActive: true),
            User(id: 2, name: "Hoa", isActive: false),
        ]
        let userService = UserService()
        print(userService.checkUser(users: users, userId: 1).message)

        let searchService = SearchService()

        let keyword: String? = "Hải"

        let searchStatus = searchService.searchOrderByProductName(
            keyword: keyword,
            orders: orders
        )
        print(searchStatus.message)

    }

}

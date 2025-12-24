import Foundation

// =======================================================
// OPTIONAL + GUARD LET + INOUT (E-COMMERCE PRACTICE)
// Quy ước: Mỗi bài = 1 commit
// =======================================================

// MARK: - Helpers
func printHeader(_ title: String) {
    print("\n====================")
    print(title)
    print("====================")
}

// MARK: - Model
struct Product {
    let sku: String
    let name: String
    let price: Double
}



// =======================================================
// MARK: - Bài 08 – Validate SKU
// Commit: "B08 - Validate SKU"
// =======================================================
func validateSKU(_ sku: String?) {
    guard let sku = sku else {
        print("Chưa nhập mã sản phẩm")
        return
    }

    guard !sku.isEmpty else {
        print("Mã sản phẩm rỗng")
        return
    }

    guard sku.hasPrefix("SKU-") else {
        print("Sai định dạng SKU")
        return
    }

    print("SKU hợp lệ:", sku)
}

printHeader("Test Bài 08")
validateSKU(nil)
validateSKU("")
validateSKU("ABC-01")
validateSKU("SKU-001")


// =======================================================
// MARK: - Bài 09 – Validate Price
// Commit: "B09 - Validate price"
// =======================================================
func validatePrice(_ text: String?) {
    guard let text = text, !text.isEmpty else {
        print("Chưa nhập giá")
        return
    }
    
    guard let price = Double(text) else {
        print("Giá không hợp lệ")
        return
    }
    
    guard price > 0 else {
        print("Giá phải lớn hơn 0")
        return
    }
    
    print("Giá hợp lệ:", price)
}
printHeader("Test Bài 09")
validatePrice(nil)
validatePrice("")
validatePrice("abc")
validatePrice("-10")
validatePrice("150000")


// =======================================================
// MARK: - Bài 10 – Tính thành tiền
// Commit: "B10 - Tinh thanh tien"
// =======================================================
func calcTotal(priceText: String?, quantityText: String?) {
    guard let priceText = priceText,
          let price = Double(priceText) else {
        print("Giá không hợp lệ")
        return
    }
    
    guard let quantityText = quantityText,
          let quantity = Int(quantityText),
          quantity > 0 else {
        print("Số lượng không hợp lệ")
        return
    }
    
    let total = price * Double(quantity)
    print("Thành tiền:", total)
}

printHeader("Test Bài 10")
calcTotal(priceText: "10000", quantityText: "2")
calcTotal(priceText: "abc", quantityText: "2")
calcTotal(priceText: "10000", quantityText: "-1")



// =======================================================
// MARK: - Bài 11 – Tạo sản phẩm
// Commit: "B11 - Create product with validation"
// =======================================================
func createProduct(
    sku: String?,
    name: String?,
    priceText: String?
) -> Product? {
    
    guard let sku = sku, !sku.isEmpty else {
        print("SKU không được rỗng")
        return nil
    }
    
    guard sku.hasPrefix("SKU-") else {
        print("SKU sai định dạng")
        return nil
    }
    
    guard let name = name, !name.isEmpty else {
        print("Tên sản phẩm không được rỗng")
        return nil
    }
    
    guard let priceText = priceText, !priceText.isEmpty else {
        print("Chưa nhập giá")
        return nil
    }
    
    guard let price = Double(priceText) else {
        print("Giá không hợp lệ")
        return nil
    }
    
    guard price > 0 else {
        print("Giá phải lớn hơn 0")
        return nil
    }
    
    let product = Product(
        sku: sku,
        name: name,
        price: price
    )
    
    print("Tạo sản phẩm thành công:", product.sku)
    return product
}
printHeader("Test Bài 11")
createProduct(sku: nil, name: "iPhone", priceText: "20000")
createProduct(sku: "SKU-001", name: nil, priceText: "20000")
createProduct(sku: "ABC-002", name: "iPhone11", priceText: "20000")
createProduct(sku: "SKU-003", name: "iPhone12", priceText: "-10")
createProduct(sku: "SKU-004", name: "iPhone6", priceText: "20000")



// =======================================================
// MARK: - Bài 12 – Hiểu inout
// Commit: "B12 - Inout basic"
// =======================================================
func increase(_ value: inout Int) {
    value += 1
}
printHeader("Test Bài 12")
var number = 10
print("Trước increase:", number)
increase(&number)
print("Sau increase:", number)



// =======================================================
// MARK: - Bài 13 – Add to Cart
// Commit: "B13 - Add product to cart"
// =======================================================
var cart: [String: Int] = ["SKU-001": 1]

let priceList: [String: Double] = [
    "SKU-001": 120000,
    "SKU-002": 99000
]
func addToCart(
    sku: String?,
    quantityText: String?,
    cart: inout [String: Int],
    priceList: [String: Double]
) {
    
    guard let sku = sku, !sku.isEmpty else {
        print("SKU không hợp lệ")
        return
    }
    
    guard priceList[sku] != nil else {
        print("SKU không tồn tại trong bảng giá")
        return
    }
    
    guard let quantityText = quantityText,
          let quantity = Int(quantityText),
          quantity > 0 else {
        print("Số lượng không hợp lệ")
        return
    }
    
    cart[sku, default: 0] += quantity
    
    print("Đã thêm \(sku) - SL: \(quantity)")
}

printHeader("Test Bài 13")

addToCart(sku: nil, quantityText: "2", cart: &cart, priceList: priceList)
addToCart(sku: "SKU-003", quantityText: "2", cart: &cart, priceList: priceList)
addToCart(sku: "SKU-001", quantityText: "-1", cart: &cart, priceList: priceList)
addToCart(sku: "SKU-001", quantityText: "2", cart: &cart, priceList: priceList)

print("Cart hiện tại:", cart)

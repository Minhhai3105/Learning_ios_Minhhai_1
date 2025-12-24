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

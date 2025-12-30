// Bài 1: In các số từ 1 đến 10
for i in 1...10 {
    print("i = \(i)")
}
// Bài 2: tổng các số trong mảng cho sẵn
print("\n bài 2")
let numbers: [Int] = [1, 2, 3, 4, 5]
var total: Int = 0
for number in numbers {
    total += number
}
print("Tổng các số trong mảng: \(total)")
    
// bài 3: in các số lẻ từ 1 đến 10( Dùng continue để bỏ qua số chẵn )
print("\n bài 3")
for i in 1...10 {
    if i % 2 == 0 {
        continue 
    }
    print(i)
}

// bài 4: viết hàm in ra lời chào  greet(name: String)
print("\n bài 4")
func greet(name: String) {
    print("Hello \(name)")
}
greet(name: "An")
greet(name: "Binh")

// bài 5: viết hàm tính bình phương của một số nguyên
print("\n bài 5")
func square(_ number: Int) -> Int {
    return number * number
}
print(square(4))
print(square(7))

// Bài 6: viết hàm in lời chào, nếu ko truyền tên thì dùng mặc định
print("\n bài 6")

func greet2(name: String = "Guest") {
    print("Hello \(name)")
}

greet2()
greet2(name: "Hải")

//bài 7: viết hàm in ra tất cả số được truyền vào( dùng variadic parameter Int )
print("\n bài 7")
func printNumber(_ numbers: Int...) {
    for number in numbers {
        print(number)
    }
}
printNumber(1, 2, 3)

// bài 8: kiểm tra số có âm hay không ( nếu số < 0 thì throw lỗi, nếu hợp lệ thì in Valid number
print("\n bài 8")
enum NumberError: Error {
    case invaildNumber
}
func checkNumber(_ number: Int) throws {
    if number < 0 {
        throw NumberError.invaildNumber
    }
}

do {
    try checkNumber (5)
    print("Vaild Number")
} catch NumberError.invaildNumber {
    print("Invalid number")
}

// bài 9: viết hàm đặt biến về 0 ( dùng inout )
print("\n bài 9")
func Zero(_ value: inout Int) {
    value = 0
}
var x = 10
print("Before \(x)")
Zero(&x)
print("After: \(x)")


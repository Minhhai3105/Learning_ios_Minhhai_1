import UIKit

//var n: Int = 9
//let n = 10
//var array: [Int] = [1,2,31,21,4,5,10,11,12]
//print("Nhap so n:", n)
//for i in 1..<10 {
//        print(i % 3 == 0 ? "Yes" : "No")
//    }


//let arrays: [String] = ["Hai", "Tuan", "Cuong", "Thanh"]

//for i in 0..<arrays.count {
//    if arrays[i] == "Hai" {
//        print("Hai o vi tri thu:", i)
//    }
//}

      
struct User {
    let id: Int
    var name: String
    var age: Int
}

let array : [User] = [ User(id: 1, name: "Hai", age:20),
                       User(id: 2, name: "Tuan", age:15),
                       User(id: 3, name: "Cuong", age:11),
                       User(id: 4, name: "Hoang", age:28),
                       User(id: 5, name: "Than", age:10),
]
for user in array {
    if user.age<18{
        print("Nguoiduoi18: ", user.name,user.age)
    }
}

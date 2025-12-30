

struct Car {
    let id: Int
    let name: String
    let color: String
    let type: CarType
}

struct CarType {
    let id: Int
    let name: String
    let wheelCount: Int
}

let carTypes: [CarType] = [
    CarType(id: 1, name: "Sedan", wheelCount: 4),
    CarType(id: 2, name: "SUV", wheelCount: 4),
    CarType(id: 3, name: "Truck", wheelCount: 6),
]

let sedan = carTypes.first { $0.name == "Sedan" }!
let suv   = carTypes.first { $0.name == "SUV" }!
let truck = carTypes.first { $0.name == "Truck" }!

let cars: [Car] = [
    Car(id: 1, name: "Car A", color: "Red",   type: sedan),
    Car(id: 2, name: "Car B", color: "Black", type: sedan),
    Car(id: 3, name: "Car C", color: "Red",   type: suv),
    Car(id: 4, name: "Car D", color: "White", type: suv),
    Car(id: 5, name: "Car E", color: "Black", type: truck),
    Car(id: 6, name: "Car F", color: "Red",   type: truck),
]

// câu 2
print("\n Câu 2: in ra thông tin từng xe")
for car in cars {
    print(car.name, ",", car.type.name, ",", car.color, ",", car.type.wheelCount)
}

// câu 3
print("\n câu 3: Lọc ra màu Red và có bánh xe là 4")
for car in cars {
    if car.color == "Red", car.type.wheelCount == 4 {
        print(car.name, ",", car.type.name, ",", car.color, ",", car.type.wheelCount)
    }
}
// câu 4
print("\n Câu 4")
var carName: [String] = []
for car in cars {
    carName.append(car.name)
}
print("\nDanh sách tên xe:", carName)
// câu 5
print("\n Câu 5")
var vehicleType: Set<String> = []

for car in cars {
    vehicleType.insert(car.type.name)
}
print(vehicleType)
// câu 6
print("\n Câu 6")
print("Có SUV và có 4 bánh ko?", vehicleType.contains("SUV"))
// cau 7
print("\n Câu 7")
print("Danh sách các xe có cùng màu")
var CarColor: [String: [Car]] = [:]
for car in cars {
    let color = car.color
    
    if CarColor[color] == nil {
        CarColor[color] = [car]
    } else {
        CarColor[color]?.append(car)
        
    }
}
for (color, cars) in CarColor {
    print("Màu \(color) có \(cars.count) xe")
}

// cau 8: Tạo 1 Dictionary để đếm số lượng xe theo từng màu
print("\n Câu 8")
var carCountColor: [String: Int] = [:]
for car in cars {
    let color = car.color
    
    if carCountColor[color] == nil {
        carCountColor[color] = 1
    }else {
        carCountColor[color]! += 1
    }
    
}
for (color, count) in carCountColor {
    print("Màu", "\(color) : \(count)")
}

// câu 9:
//Viết hàm lọc xe theo loại xe
print("\n Câu 9")
func groupCarsByType(cars: [Car]) -> [String: [Car]] {
    var result: [String: [Car]] = [:]

    for car in cars {
        let typeName = car.type.name

        if result[typeName] == nil {
            result[typeName] = [car]
        } else {
            result[typeName]?.append(car)
        }
    }

    return result
}

let carsByType = groupCarsByType(cars: cars)

for (type, cars) in carsByType {
    print("Loại xe:", type)
    for car in cars {
        print(" -", car.name)
    }
}

// câu 10
print("\n Câu 10")
func getCarWithMaxWheels( cars: [Car] ) -> Car? {
    if cars.isEmpty {
    return nil
    }
    var maxCar: Car = cars[0]
    for car in cars {
        if car.type.wheelCount > maxCar.type.wheelCount {
            maxCar = car
        }
    }
    return maxCar
}
if let car = getCarWithMaxWheels(cars: cars){
    print("Xe có nhiều bánh nhất là: ", car.name,",", car.type.name, ",", car.type.wheelCount)
}


// câu 11
print("\n Câu 11")
var carsByTypeAndColor: [String: [String: [Car]]] = [:]

for car in cars {
    let typeName = car.type.name
    let color = car.color
    
    if carsByTypeAndColor[typeName] == nil {
        carsByTypeAndColor[typeName] = [:]
    }
    
    if carsByTypeAndColor[typeName]![color] == nil {
        carsByTypeAndColor[typeName]![color] = []
    }
    carsByTypeAndColor[typeName]![color]!.append(car)

}
for (type, colors) in carsByTypeAndColor {
    print(type)
    for (color, cars) in colors {
        print("- \(color) ->", cars.map { $0.name })
    }
}


// cau 12
print("\n Câu 12")
var carCountByType: [String: Int] = [:]

for car in cars {
    let typeName = car.type.name

    if carCountByType[typeName] == nil {
        carCountByType[typeName] = 1
    } else {
        carCountByType[typeName]! += 1
    }
}

for (type, count) in carCountByType {
    print("\(type): \(count) xe")
}

// cau 13
print("\n Câu 13")
func isValidData(cars: [Car]) -> Bool {
    var idSet: Set<Int> = []

    for car in cars {
        // kiểm tra id trùng
        if idSet.contains(car.id) {
            return false
        }
        idSet.insert(car.id)

        // kiểm tra số bánh > 0
        if car.type.wheelCount <= 0 {
            return false
        }
    }

    return true
}

if isValidData(cars: cars) {
    print("Dữ liệu hợp lệ")
} else {
    print("Dữ liệu không hợp lệ")
}

// cau 14
print("\n Câu 14")


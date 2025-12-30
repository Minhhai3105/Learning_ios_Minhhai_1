struct CarStruct {
    let id: Int
    let name: String
    var color: String
}

let ArrayStructCars: [CarStruct] = [
    CarStruct(id: 1, name: "Audi", color: "blue"),
    CarStruct(id: 2, name: "Peugeot", color: "red"),
    CarStruct(id: 3, name: "Mazda", color: "blue"),
    CarStruct(id: 4, name: "Thaco", color: "black")
]

for car in ArrayStructCars {
    if car.color == "blue" {
        print("-STRUCT-")
        print("ID:", car.id, "Name:", car.name, "Color:", car.color)
    }
}
//
class CarClass {
    let id: Int
    let name: String
    var color: String

    init(id: Int, name: String, color: String) {
        self.id = id
        self.name = name
        self.color = color
    }
}

let ArrayClassCars: [CarClass] = [
    CarClass(id: 5, name: "Toyota", color: "blue"),
    CarClass(id: 6, name: "Honda", color: "red"),
    CarClass(id: 7, name: "BMW", color: "blue"),
    CarClass(id: 8, name: "Kia", color: "black")
]

for car in ArrayClassCars {
    if car.color == "blue" {
        print("-CLASS-")
        print("ID:", car.id, "Name:", car.name, "Color:", car.color)
    }
}


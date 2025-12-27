struct Student {
    let id: Int
    let name: String
    let score: Int
}

let students: [Student] = [
    Student(id: 1, name: "An", score: 8),
    Student(id: 2, name: "Binh", score: 4),
    Student(id: 3, name: "Chi", score: 7),
    Student(id: 4, name: "An", score: 6)
]

// Phần A

// Bài A1 – Lấy danh sách tất cả sinh viên
print("\n Bài A1")
for student in students {
    print(student.id, ",", student.name, ",", student.score)
}
//Bài A2 – Lấy danh sách tên sinh viên
print("\n Bài A2")
var names: [String] = []

for student in students {
    names.append(student.name)
}

print(names)

//Bài A3 – Lọc sinh viên có score >= 5
print("\n Bài A3")
for student in students {
    if student.score >= 5 {
        print(student.name, "=", student.score)
    }
}

//Bài A4 – Kiểm tra có sinh viên rớt không (score < 5)
print("\n Bài A4")
var Fail = false

for student in students {
    if student.score < 5 {
        Fail = true
    }
}

print("Có sinh viên nào rớt không?", Fail)

//Bài A5 – Kiểm tra tất cả sinh viên đều đậu
print("\n Bài A5")
var Pass = true

for student in students {
    if student.score < 5 {
        Pass = false
    }
}

print("Tất cả sinh viên đều đậu đúng ko?", Pass)

//Bài A6 – Tìm sinh viên có id = 2
print("\n Bài A6")
for student in students {
    if student.id == 2 {
        print(student.name, "\n id=", student.score)
    }
}

//PHẦN B — SET

//Bài B1 – Tạo Set<String> chứa tên sinh viên (loại trùng)
print("\n Bài B1")
var name: Set<String> = []

for student in students {
    name.insert(student.name)
}
print(name)

//Bài B2 – Kiểm tra Set có chứa "An" không
print("\n Bài B2")
print("Có An không?", name.contains("An"))

//Bài B3 – Set số nguyên
print("\n Bài B3")
var number: Set<Int> = [1, 2, 3]

number.insert(4)
number.remove(2)

print(number)

//Bài B4 – Union / Intersection / Subtracting
print("\n Bài B4")

let a: Set<Int> = [1, 2, 3, 4]
let b: Set<Int> = [3, 4, 5]

print("Uni:", a.union(b))
print("Inter:", a.intersection(b))
print("Sub:", a.subtracting(b))


//PHẦN C — DICTIONARY
//Bài C1 – Tạo Dictionary<Int, Student>






//Bài C2 – Lấy sinh viên có id = 3


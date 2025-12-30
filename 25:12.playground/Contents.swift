import Foundation

struct Student {
    let id: Int
    let name: String
    let score: Int
}

let students: [Student] = [
    Student(id: 1, name: "Hai", score: 8),
    Student(id: 2, name: "Tuan", score: 4),
    Student(id: 3, name: "Cuong", score: 7),
    Student(id: 4, name: "Hoang", score: 6)
]

func printHeader(_ title: String) {
    print("\n========== \(title) ==========")
}



// PHẦN A — ARRAY

// Bài A1. Lấy danh sách tất cả sinh viên
printHeader("Bài A1")
print(students)

// Bài A2. Lấy danh sách tên sinh viên
printHeader("Bài A2")
let names = students.map { $0.name }
print(names)

// Bài A3. Lọc sinh viên có score >= 5 (filter)
printHeader("Bài A3")
let passedStudents = students.filter { $0.score >= 5 }
print(passedStudents)

// Bài A4. Kiểm tra có sinh viên nào rớt không (score < 5)
printHeader("Bài A4")
let hasFailed = students.contains { $0.score < 5 }
print("Có sinh viên rớt không?", hasFailed)

// Bài A5. Kiểm tra tất cả sinh viên đều đậu
printHeader("Bài A5")
let allPassed = students.allSatisfy { $0.score >= 5 }
print("Tất cả đều đậu?", allPassed)

// Bài A6. Tìm sinh viên có id = 2
printHeader("Bài A6")
let studentId2 = students.first { $0.id == 2 }
print(studentId2 as Any)






// =======================================================
// MARK: - PHẦN B — SET
// =======================================================

// Bài B1. Tạo Set<String> chứa tên sinh viên (loại trùng)
printHeader("Bài B1")
let nameSet: Set<String> = Set(students.map { $0.name })
print(nameSet)

// Bài B2. Kiểm tra Set có chứa "An" hay không
printHeader("Bài B2")
print("Có 'An' không?", nameSet.contains("An"))

// Bài B3. Set số nguyên ban đầu [1, 2, 3]
printHeader("Bài B3")
var numbers: Set<Int> = [1, 2, 3]
numbers.insert(4)
numbers.remove(2)
print(numbers)

// Bài B4. Union – Intersection – Subtracting
printHeader("Bài B4")
let a: Set<Int> = [1, 2, 3, 4]
let b: Set<Int> = [3, 4, 5]

print("Union:", a.union(b))
print("Intersection:", a.intersection(b))
print("Subtracting:", a.subtracting(b))






// =======================================================
// MARK: - PHẦN C — DICTIONARY
// =======================================================

// Bài C1. Tạo Dictionary<Int, Student> (key = id)
printHeader("Bài C1")
var studentDict: [Int: Student] = [:]
for student in students {
    studentDict[student.id] = student
}
print(studentDict)

// Bài C2. Lấy sinh viên có id = 3
printHeader("Bài C2")
print(studentDict[3] as Any)

// Bài C3. Duyệt Dictionary và in <id - name - score>
printHeader("Bài C3")
for (id, student) in studentDict {
    print("\(id) - \(student.name) - \(student.score)")
}

// Bài C4. Lấy tất cả key và value
printHeader("Bài C4")
print("Keys:", Array(studentDict.keys))
print("Values:", Array(studentDict.values))

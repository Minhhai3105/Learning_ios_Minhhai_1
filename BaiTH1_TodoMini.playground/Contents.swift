import Foundation
struct Student: Equatable {
    let id: Int
    let name: String
    var score: Double
}
class StudentManager {
    private var studentArray: [Student] = []
    private var nextId: Int = 1
    
    func addStudent(name: String, score: Double) {
        guard !name.isEmpty else {
            print("Ten ko hop le")
            return
        }
        guard (0...10).contains(score) else {
            print("Diem ko hop le")
            return
        }
        let newStudent = Student(id: nextId, name: name, score: score)
        studentArray.append(newStudent)
        nextId += 1
    }
    
    func printStudent() {
        print("Danh sach sinh vien")
        studentArray.forEach{ st in
            let status = st.score >= 5 ? "PASS":"FAIL"
            print("\(st.name) - \(status)")
            
        }
    }
    func averageScore() -> Double {
        guard !studentArray.isEmpty else {
            return 0
        }
        var total: Double = 0
        for student in studentArray{
            total += student.score
        }
        return total / Double(studentArray.count)
    }
    func updateScore(id: Int, newScore: Double) {
        guard (0...10).contains(newScore) else {
            print("Diem moi ko hop le")
            return
        }
        for i in 0..<studentArray.count {
        if studentArray[i].id == id {
            studentArray[i].score = newScore
            return
        }
    }
    print("Ko tim thay sinh vien")
    }
    func passedStudents()->[Student] {
        var result: [Student] = []
        for i in studentArray {
            if i.score >= 5 {
                result.append(i)
            }
        }
        return result
    }
    func failedStudents()->[Student] {
        var result: [Student] = []
        for i in studentArray {
            if i.score < 5 {
                result.append(i)
            }
        }
        return result
    }
}
    

let manager = StudentManager()
manager.addStudent(name: "a", score: 9)
manager.addStudent(name: "b", score: 4)
manager.addStudent(name: "c", score: 7)

manager.printStudent()
print("Sinh viên đậu: \(manager.passedStudents())")
print("Sinh viên trượt: \(manager.failedStudents())")

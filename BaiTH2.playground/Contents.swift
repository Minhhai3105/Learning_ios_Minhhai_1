import Foundation
struct Todo: Equatable{
    let id: Int
    let title: String
    var isCompleted: Bool
}
class TodoManager {
    private var todoArray: [Todo] = []
    private var nextId: Int = 1
    
    func addTodo(title: String){
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            print("Không hợp lệ")
            return
        }
        let newTodo = Todo(id: nextId, title: trimmed, isCompleted: false)
        todoArray.append(newTodo)
        nextId += 1
    }
    func toggleTodo(id: Int) {
        for i in 0..<todoArray.count {
            if todoArray[i].id == id {
                todoArray[i].isCompleted.toggle()
                continue
            }
        }
    }
    func printTodos() {
        print("Danh sách todo:")
        if todoArray.isEmpty {
            print("Danh sách rỗng")
        }
        todoArray.forEach { st in
            let icon = st.isCompleted ? "Pass" : "Fail"
            print("\(icon) \(st.title)")
        }
    }
    func removeTodo(id: Int) {
        todoArray.removeAll { $0.id == id }
    }
    func countCompletedTodos() -> Int {
        todoArray.filter { $0.isCompleted }.count
    }
    
}
let manager = TodoManager()

manager.addTodo(title: "Học Swift ")
manager.addTodo(title: "Ăn cơm")
manager.addTodo(title: " ")

manager.printTodos()

manager.toggleTodo(id: 1)
manager.printTodos()

manager.removeTodo(id: 2)
manager.printTodos()

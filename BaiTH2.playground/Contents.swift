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
        guard !title.isEmpty else{
            print("Ko được rỗng")
            return
        }
        let newTodo = Todo(id: nextId, title: title, isCompleted: true)
        todoArray.append(newTodo)
        nextId += 1
    }
    func toggleTodo(id: Int) {
        for i in 0..<todoArray.count {
            if todoArray[i].id == id {
                todoArray[i].isCompleted.toggle()
                break
            }
        }
    }
    func printTodos() {
        print("Danh sách todo:")
        if todoArray.isEmpty {
            print("Danh sách rỗng")
            return
        }
        todoArray.forEach { st in
            let status: String = st.isCompleted ? "[Pass]" : "[Fail]"
            print("[\(status)] ID:\(st.id) - TITLE: \(st.title) ")
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
manager.removeTodo(id: 2)


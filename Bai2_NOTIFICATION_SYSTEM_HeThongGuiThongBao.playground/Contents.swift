import Foundation
// Hệ thống gửi thông báo
struct Message {
    let title: String
    let body: String
}

protocol Notifiable {
    var channelName: String { get }
    func send(_message: Message)->Bool
}

extension Notifiable {
    func PrintSendMessage(_message: Message) {
        if send(_message: _message) {
            print("Gửi thành công \(_message.title) \(_message.body) qua \(channelName)")
        } else {
            print("Gửi thất bại qua kênh \(channelName)")
        }
    }
}
struct EmailNotifier: Notifiable {
    var channelName: String = "Email"
    func send(_message: Message) -> Bool {
        print("\(channelName) đã gửi \(_message.title) - \(_message.body)")
        return true
    }
}
struct SMSNotifier: Notifiable {
    var channelName: String {
        return "SMS"
    }
    func send(_message: Message) -> Bool {
        print("\(channelName) đã gửi \(_message.title) - \(_message.body)")
        return true
    }
}
struct ConsoleNotifier: Notifiable {
    var channelName: String {
        return "Console"
    }
    func send(_message: Message) -> Bool {
        print(" \(channelName) đã gửi \(_message.title) - \(_message.body)")
        return true
    }
}
let _message = Message(title: "đơn xin nghỉ học", body: "thích" )
let SMS1 = SMSNotifier()
SMS1.PrintSendMessage(_message: _message)




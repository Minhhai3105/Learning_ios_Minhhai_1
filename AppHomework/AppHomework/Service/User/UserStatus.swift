enum UserStatus {
    case usernotFound
    case userInactive
    case userActive

    var message: String {
        switch self {
        case .usernotFound:
            return "Không tìm thấy user"
        case .userInactive:
            return "User bị khóa"
        case .userActive:
            return "User hợp lệ"
        }
    }
}

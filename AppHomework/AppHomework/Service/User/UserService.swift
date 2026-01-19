struct UserService {
    func checkUser(users: [User], userId: Int) -> UserStatus {
        let user = users.first { $0.id == userId }

        if user == nil {
            return .usernotFound
        }
        if user!.isActive {
            return .userActive
        } else {
            return .userInactive
        }
    }
}

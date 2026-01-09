enum LoginError {
    case emptyUsername
    case emptyPassword
    case passwordTooShort
    case invalidCredential
}
enum LoginResult {
    case success(message: String)
    case failure(error: LoginError)
}
func loginErrorMessage(error: LoginError){
    switch error {
        case .emptyUsername:
            print("Username null")
        case .emptyPassword:
            print("Password null")
        case .passwordTooShort:
            print("Password too short")
        case .invalidCredential:
            print("InvalidCredential")
    }
}
func login(username: String?, password: String?) -> LoginResult {
    guard let username = username else {
        return .failure(error: .emptyUsername)
    }
    guard let password = password else {
        return .failure(error: .emptyPassword)
    }
    
    if password.count <= 6 {
        return .failure(error: .passwordTooShort)
    }
    return .success(message: "Thanh cong")
}
let status = login(username: "hai", password: "12345678")
switch status {
case .success(message: let message):
    print(message)
case .failure(error: let error):
    loginErrorMessage(error: error)
}

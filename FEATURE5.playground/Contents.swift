enum RegistrationError: Error {
    case invalidUsername
    case passwordTooShort
    case passwordNoNumber
}
func register(username: String, password: String) throws -> String {

    if username.isEmpty {
        throw RegistrationError.invalidUsername
    }

    if password.count < 6 {
        throw RegistrationError.passwordTooShort
    }

    var hasNumber = false
    for char in password {
        if char.isNumber {
            hasNumber = true
            break
        }
    }
    if hasNumber == false {
        throw RegistrationError.passwordNoNumber
    }
    return username
}
do {
    let user = try register(username: "admin", password: "")
    print("Registered: admin")
} catch RegistrationError.invalidUsername {
    print("Invalid username")
} catch RegistrationError.passwordTooShort {
    print("Password too short")
} catch RegistrationError.passwordNoNumber {
    print("Password must contain number")
} catch {
    print("Error")
}


    


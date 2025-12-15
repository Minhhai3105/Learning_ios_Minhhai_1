//
//  main.swift
//  TimHieuBai2
//
//  Created by Cao Hai on 16/12/25.
//

//vd struct

import Foundation

struct User {
    var name: String
}

var u1 = User(name: "Hải")
var u2 = u1
u2.name = "Minh"

print(u1.name)
print(u2.name)

// vd class
print("\nClass:")

class UserClass {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let c1 = UserClass(name: "Hải")
let c2 = c1
c2.name = "Minh"

print(c1.name)
print(c2.name)

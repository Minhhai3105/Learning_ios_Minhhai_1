//
//  main.swift
//  TimHieuBai2
//
//  Created by Cao Hai on 16/12/25.
//

//vd struct

import Foundation


func Struct() {
    struct User {
        var name: String
    }

    var a = User(name: "Hải")
    var b = a
    b.name = "Minh"

    print(a.name)
    print(b.name)
}


// vd class
func Class(){
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
}




func Counter(){
    class Counter {
        var value = 0
    }

    let d1 = Counter()
    let d2 = d1

    d2.value += 1
    print(d1.value) // 1
}

Struct()
Class()
Counter()

//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class User {
    var name: String
    var age: Int
    var height: Int
    
    init(name:String, age: Int, height: Int){
        self.name = name
        self.age = age
        self.height = height
    }
    
    func introduce() {
        print("私の名前は\(self.name)、年齢は\(self.age)歳。")
        print("身長は\(self.height)cmです。")
        print("よろしくお願いします！")
    }
    
}


let user = User(name: "佐藤", age: 21, height: 165)
user.introduce()



let scores: [Int] = [71, 53, 89, 97, 73, 83]

func calculateAve(scores: Array<Int>) -> Int {
    var sum: Int
    sum = 0
    for score in scores {
        sum += score
    }
    return sum / scores.count
}

let ave = calculateAve(scores)
print(ave)



var num1: Int? = 21
var num2: Int! = 10

num1! + num2

var name: String?

if name == nil {
    print("名無しさん")
}else{
    print(name!)
}











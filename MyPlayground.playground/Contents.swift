//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Human {
    var name: String
    var age: Int
    var state: String?
    var children:[Human] = []
    
    init(name:String, age:Int){
        self.name = name
        self.age = age
        print("\(name)がやってきました")
    }
    
    func walk() {
        self.state = "walking"
        print("\(name)が歩きます")
    }
    
    func sit() {
        self.state = "sitting"
        print("\(name)が座ります")
    }
    
    func showState() {
        if (self.state != nil) {
            switch self.state! {
            case "walking" :
                print("\(self.name)が歩いています")
            case "sitting" :
                print("すわってる")
            default :
                break
            }
        }
    }
    
    func showChildren() {
        for child in self.children{
            print("\(child.name)")
        }
    }
    
}


let yam = Human(name: "yama", age: 3)
yam.walk()
yam.showState()

//
//class Baby: Human {
//    override func walk() {
//        <#code#>
//    }
//}


func circleArea(length: Double) -> Double{
    return length * length * 3.14
}



circleArea(2)

var human = [String: String]()

human = ["name": "カエラ", "age": "31", "born": "足立区"]

print(human["name"]) // => Optional("カエラ")




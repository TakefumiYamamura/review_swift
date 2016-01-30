//
//  Todo.swift
//  AgainToDo
//
//  Created by TakefumiYamamura on 2016/01/28.
//  Copyright © 2016年 div. All rights reserved.
//

import UIKit

enum TodoPriority:Int {
    case Low = 0
    case Middle = 1
    case High = 2
    
    func color() -> UIColor {
        switch self{
        case .Low:
            return UIColor.yellowColor()
        case .Middle:
            return UIColor.greenColor()
        case .High:
            return UIColor.redColor()
        }
    }
}

//eunm TodoPriority: Int {
//    case Low = 0
//    case Middle =1
//    case High = 2
//}

class Todo: NSObject {
    var text = ""
    var descript = ""
    var priority:TodoPriority = .Low

}

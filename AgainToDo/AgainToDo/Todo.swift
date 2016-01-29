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

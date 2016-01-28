//
//  TodoCollection.swift
//  AgainToDo
//
//  Created by TakefumiYamamura on 2016/01/28.
//  Copyright © 2016年 div. All rights reserved.
//

import UIKit

class TodoCollection: NSObject {
    var todos:[Todo] = []
    
    func fetchTodos(){
        for (var i = 0; i < 7; i++) {
            let todo = Todo()
            todo.text = "テスト\(i)"
            self.todos.append(todo)
        }
    }

}

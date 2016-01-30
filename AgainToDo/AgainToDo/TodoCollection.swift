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
    static let sharedInstance = TodoCollection()
    
    func fetchTodos(){
        let defaults = NSUserDefaults.standardUserDefaults()
        if let todoList = defaults.objectForKey("todoList")  as? Array<Dictionary<String, AnyObject>> {
            for dic in todoList {
                self.todos.append(TodoCollection.convertTodoModel(dic))
            }
        }
        
        
    }
    
    func addTodoCollection(todo:Todo){
        self.todos.append(todo)
        self.save()
    }
    
    func save(){
        var todolist: Array<Dictionary<String, AnyObject>> = []
        for todo in self.todos{
            let todic = TodoCollection.convertDictionary(todo)
            todolist.append(todic)
        }
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(todolist, forKey: "todoList")
        defaults.synchronize()
    }
    
    class func convertDictionary(todo: Todo) -> Dictionary<String, AnyObject> {
        var dic = Dictionary<String, AnyObject>()
        dic["title"] = todo.text
        dic["descript"] = todo.descript
        dic["priority"] = todo.priority.rawValue
        return dic
    }
    class func convertTodoModel(attiributes: Dictionary<String, AnyObject>) -> Todo {
        let todo = Todo()
        todo.text = attiributes["title"] as! String
        todo.descript = attiributes["descript"] as! String
        todo.priority = TodoPriority(rawValue: attiributes["priority"] as! Int)!
        return todo
    }

}

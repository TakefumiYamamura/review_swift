//
//  NewTodoViewController.swift
//  AgainToDo
//
//  Created by TakefumiYamamura on 2016/01/28.
//  Copyright © 2016年 div. All rights reserved.
//

import UIKit

class NewTodoViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var prioritySegment: UISegmentedControl!

    @IBOutlet weak var descriptionView: UITextView!
    
    @IBOutlet weak var todoField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionView.layer.cornerRadius = 5
        descriptionView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        descriptionView.layer.borderWidth = 1
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "tapGesture:")
        self.view.addGestureRecognizer(tapRecognizer)
        todoField.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func tapGesture(sender: UITapGestureRecognizer){
        todoField.resignFirstResponder()
        descriptionView.resignFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: UIBarButtonItemStyle.Plain, target: self, action: "close")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.Plain, target: self, action: "save")
    }
    
    func close() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func save() {
        if todoField.text!.isEmpty {
            
        } else {
            let todo = Todo()
            todo.text = todoField.text!
            todo.descript = descriptionView.text
            todo.priority = TodoPriority(rawValue: prioritySegment.selectedSegmentIndex)!
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

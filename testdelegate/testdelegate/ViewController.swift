//
//  ViewController.swift
//  testdelegate
//
//  Created by TakefumiYamamura on 2016/01/29.
//  Copyright © 2016年 div. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        button.frame.size = CGSizeMake(100, 50)
        button.center = self.view.center
        button.setTitle("Start Modal", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        button.addTarget(self, action: "tapButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
    }
    
    
    func tapButton(sender: AnyObject) {
        showModal()
//        performSegueWithIdentifier("modalSegue", sender: self)
        
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //ボタンが押された時にshowModalメソッドを実行
    @IBAction func myButton(sender: UIButton) {
        showModal()
    }
    
    //ModalViewを表示する
    func showModal() {
        let modalView = ModalView(frame: self.view.bounds)
        self.view.addSubview(modalView)
    }
}

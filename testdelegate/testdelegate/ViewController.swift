//
//  ViewController.swift
//  testdelegate
//
//  Created by TakefumiYamamura on 2016/01/29.
//  Copyright © 2016年 div. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModalViewDelegate {
    @IBOutlet weak var label: UILabel!
    let button = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        modalView.modalViewDelegate = self
        self.view.addSubview(modalView)
    }
    
    func close(text:String) {
        button.setTitle(text, forState: UIControlState.Normal)
    }
}

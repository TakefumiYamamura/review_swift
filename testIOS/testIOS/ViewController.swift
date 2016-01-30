//
//  ViewController.swift
//  testIOS
//
//  Created by TakefumiYamamura on 2016/01/29.
//  Copyright © 2016年 div. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = UIButton()
        button.frame.size = CGSizeMake(88, 44)
        button.center = self.view.center
        button.setTitle("Next", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.grayColor(), forState: UIControlState.Selected)
        button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonClicked(sender: UIButton){
        print("タップされました！")
    }


}


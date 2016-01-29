//
//  ModalViewController.swift
//  testdelegate
//
//  Created by TakefumiYamamura on 2016/01/29.
//  Copyright © 2016年 div. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        let label = UILabel()
        label.frame.size = CGSizeMake(100, 50)
        label.center = self.view.center
        label.text = "Modal"
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        self.view.addSubview(label)

        // Do any additional setup after loading the view.
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

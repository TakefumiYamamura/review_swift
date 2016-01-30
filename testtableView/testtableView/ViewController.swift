//
//  ViewController.swift
//  testtableView
//
//  Created by TakefumiYamamura on 2016/01/29.
//  Copyright © 2016年 div. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let table = UITableView()
    let data: [String] = ["ペルシャ", "シャム", "メインクーン", "サイベリアン", "ヒマラヤン"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.frame = view.frame
        view.addSubview(table)
        table.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = data[indexPath.section]
        
        return cell
    }
    
    
}
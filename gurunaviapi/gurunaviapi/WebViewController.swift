//
//  WebViewController.swift
//  gurunaviapi
//
//  Created by TakefumiYamamura on 2016/02/10.
//  Copyright © 2016年 div. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var selectedRest: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()
        let myWebView = WKWebView()
        myWebView.frame = self.view.frame
        self.view.addSubview(myWebView)
        
        let url = self.selectedRest!.url!
        let myURL = NSURL(string: url)
        let myURLReq =  NSURLRequest(URL: myURL!)
        myWebView.loadRequest(myURLReq)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
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

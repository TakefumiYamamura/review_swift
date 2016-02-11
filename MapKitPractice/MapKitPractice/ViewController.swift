//
//  ViewController.swift
//  MapKitPractice
//
//  Created by TakefumiYamamura on 2016/02/11.
//  Copyright © 2016年 div. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class ViewController: UIViewController {
    let myMapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        myMapView.frame = self.view.frame
        self.view.addSubview(myMapView)
        
        let longPressGesture = UILongPressGestureRecognizer()
        longPressGesture.addTarget(self, action: "longPressed:")
        myMapView.addGestureRecognizer(longPressGesture)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func longPressed(sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizerState.Began {
            return
        }
        
        let tappedLocation = sender.locationInView(myMapView)
        let tappedPoint = myMapView.convertPoint(tappedLocation, toCoordinateFromView: myMapView)
        
        let pin = MKPointAnnotation()
        pin.coordinate = tappedPoint
        pin.title = "タイトル"
        pin.subtitle = "サブタイトル"
        self.myMapView.addAnnotation(pin)
        
        
        
        print("Hello World!!")
    }



}


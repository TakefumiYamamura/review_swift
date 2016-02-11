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



class ViewController: UIViewController, CLLocationManagerDelegate {
    let myMapView = MKMapView()
    let myLocationManager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        myMapView.frame = self.view.frame
        self.view.addSubview(myMapView)
        
        let longPressGesture = UILongPressGestureRecognizer()
        longPressGesture.addTarget(self, action: "longPressed:")
        myMapView.addGestureRecognizer(longPressGesture)
        
        self.myLocationManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.NotDetermined {
            //３.まだ承認が得られていない場合は、認証ダイアログを表示
            myLocationManager.requestAlwaysAuthorization()
        }
        myLocationManager.startUpdatingLocation()



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
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("現在地の取得に成功しました")
        // 配列から現在座標を取得（配列locationsの中から最新のものを取得する）
        let myLocation = locations.last! as CLLocation
        //Pinに表示するためにはCLLocationCoordinate2Dに変換してあげる必要がある
        let currentLocation = myLocation.coordinate
        //ピンの生成と配置
        let pin = MKPointAnnotation()
        pin.coordinate = currentLocation
        pin.title = "現在地"
        self.myMapView.addAnnotation(pin)
        
        //アプリ起動時の表示領域の設定
        //delta数字を大きくすると表示領域も広がる。数字を小さくするとより詳細な地図が得られる。
        let mySpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let myRegion = MKCoordinateRegionMake(currentLocation, mySpan)
        myMapView.region = myRegion


    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("現在地の取得に失敗しました")
    }





}


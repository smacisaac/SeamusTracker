//
//  MapViewController.swift
//  SEAMUSTRACKERAPP
//
//  Created by Seamus MacIsaac on 2017-06-20.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit
import MapKit
import Foundation




class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBAction func onTappedCheck(_ sender: Any) {
        print("Tapped")
        if let coord = self.manager.location?.coordinate {
            let anno = MKPointAnnotation()
            anno.coordinate = coord
            self.mapView.addAnnotation(anno)
        }
        
    }
    
    @IBAction func onTappedRecenter(_ sender: Any) {
        let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 1000, 1000)
        mapView.setRegion(region, animated: true)
        print("Recentered")
    }
    
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var manager = CLLocationManager()
    
    var updateCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            
            mapView.delegate = self
            print ("Ready to go")
            mapView.showsUserLocation = true
            manager.startUpdatingLocation()
            
            if #available(iOS 10.0, *) {
                Timer.scheduledTimer(withTimeInterval: 30, repeats: true, block: { (timer) in
                    //spawn a pokemon
                    
                    if let coord = self.manager.location?.coordinate {
                        let anno = MKPointAnnotation()
                        anno.coordinate = coord
                        self.mapView.addAnnotation(anno)
                    }
                
                })
            } else {
                // Fallback on earlier versions
            }
            
        }else{
            manager.requestWhenInUseAuthorization()
            }
        }//end of viewDidLoad
    

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations: [CLLocation]){
        if updateCount  < 3{
            let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 1000, 1000)
            mapView.setRegion(region, animated: false)
            updateCount += 1
            print("we made it")
            }else{
                manager.stopUpdatingLocation()
                }
        }







}//end of class mapViewController








//
//  MapViewController.swift
//  SEAMUSTRACKERAPP
//
//  Created by Seamus MacIsaac on 2017-06-20.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var manager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            print ("Ready to go")
            mapView.showsUserLocation = true
        }else{
            manager.requestWhenInUseAuthorization()
        }
       
        
    }
    
   
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

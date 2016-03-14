//
//  MapViewController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/4/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate{

    @IBOutlet weak var menuButton: UIBarButtonItem!
    

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.target = self.revealViewController()
        menuButton.action = Selector("revealToggle:")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {



    }

    @IBAction func addPlaceButtonPressed(sender: AnyObject) {

        

    }


}


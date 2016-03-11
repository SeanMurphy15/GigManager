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

        let acController = GMSAutocompleteViewController()
        acController.delegate = self
        self.presentViewController(acController, animated: true, completion: nil)

    }


}

extension MapViewController: GMSAutocompleteViewControllerDelegate {

    // Handle the user's selection.
    func viewController(viewController: GMSAutocompleteViewController, didAutocompleteWithPlace place: GMSPlace) {

        let annotation = MKPointAnnotation()
        annotation.coordinate = place.coordinate
        annotation.title = place.name
        annotation.subtitle = place.placeID
        mapView.addAnnotation(annotation)

        viewController.dismissViewControllerAnimated(true, completion: nil)

    }

    func viewController(viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: NSError) {
        // TODO: handle the error.
        print("Error: \(error.description)")
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    // User canceled the operation.
    func wasCancelled(viewController: GMSAutocompleteViewController) {
        print("Autocomplete was cancelled.")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

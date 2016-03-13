//
//  ConfirmGigSubmissionViewController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/12/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import UIKit
import Firebase

class ConfirmGigSubmissionViewController: UITableViewController {

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var venueTextField: UITextField!

    @IBOutlet weak var addressTextField: UITextField!

    @IBOutlet weak var dateTextField: UITextField!

    @IBOutlet weak var timeTextField: UITextField!

    @IBOutlet weak var loadInTextField: UITextField!

    @IBOutlet weak var setDurationTextField: UITextField!

    @IBOutlet weak var compensationTextField: UITextField!

    @IBOutlet weak var detailTextField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

        titleTextField.text = DataController.fetchDataFromNSUserDefaults("title")
        venueTextField.text = DataController.fetchDataFromNSUserDefaults("venue")
        addressTextField.text = DataController.fetchDataFromNSUserDefaults("address")
        dateTextField.text = DataController.fetchDataFromNSUserDefaults("date")
        timeTextField.text = DataController.fetchDataFromNSUserDefaults("time")
        loadInTextField.text = DataController.fetchDataFromNSUserDefaults("loadIn")
        setDurationTextField.text = DataController.fetchDataFromNSUserDefaults("setDuration")
        compensationTextField.text = DataController.fetchDataFromNSUserDefaults("compensation")
        detailTextField.text = DataController.fetchDataFromNSUserDefaults("detail")


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submitButtonPressed(sender: AnyObject) {

        let placeID = DataController.fetchDataFromNSUserDefaults("placeID")
        let longitude = DataController.fetchDataFromNSUserDefaults("longitude")
        let latitude = DataController.fetchDataFromNSUserDefaults("latitude")

        GigController.createGig(titleTextField.text, placeIdentifier: placeID, compensation: compensationTextField.text, detail: detailTextField.text, longitude: longitude, latitude: latitude, address: addressTextField.text, venue: venueTextField.text, confirmed: "false", date: dateTextField.text, loadIn: loadInTextField.text, setDuration: setDurationTextField.text, bandIdentifier: "band identifier needed") { (success, error, var gig) -> Void in

            if success {

              gig?.save()

                print("gig saved successfully")

            } else {


            }
        }
        
    }


}

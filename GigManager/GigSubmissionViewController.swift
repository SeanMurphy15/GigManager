//
//  GigSubmissionViewController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/10/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import UIKit
import GoogleMaps

class GigSubmissionViewController: UIViewController, UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var detailTextView: UITextView!

    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var venueTextField: UITextField!

    @IBOutlet weak var compensationTextField: UITextField!

    @IBOutlet weak var timeTextField: UITextField!

    @IBOutlet weak var dateTextField: UITextField!

    @IBOutlet weak var loadInTextField: UITextField!

    @IBOutlet weak var setDurationTextField: UITextField!

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

         self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

        dateTextField.delegate = self
        loadInTextField.delegate = self
        timeTextField.delegate = self
        setDurationTextField.delegate = self
        venueTextField.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


    func textFieldDidBeginEditing(textField: UITextField) {
        switch (textField) {
        case dateTextField:

            let datePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.Date
            textField.inputView = datePicker
            datePicker.addTarget(self, action: "datePickerChangedDate:", forControlEvents: .ValueChanged)
            break;

        case timeTextField:

            let datePicker:UIDatePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.Time
            textField.inputView = datePicker
            datePicker.addTarget(self, action: "datePickerChangedTime:", forControlEvents: .ValueChanged)
            break;

        case loadInTextField:

            let datePicker:UIDatePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.CountDownTimer
            textField.inputView = datePicker
            datePicker.addTarget(self, action: "datePickerChangedLoadIn:", forControlEvents: .ValueChanged)
            break;

        case setDurationTextField:

            let datePicker:UIDatePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.CountDownTimer
            textField.inputView = datePicker
            datePicker.addTarget(self, action: "datePickerChangedSetDuration:", forControlEvents: .ValueChanged)
            break;

        case venueTextField:

            let acController = GMSAutocompleteViewController()
            acController.delegate = self
            self.presentViewController(acController, animated: true, completion: nil)

            break

        default:
            break;
        }
    }

    func datePickerChangedDate(sender: UIDatePicker){

        let formatter = NSDateFormatter()
        formatter.dateStyle = .FullStyle
        dateTextField.text = formatter.stringFromDate(sender.date)
    }
    func datePickerChangedTime(sender: UIDatePicker){

        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        timeTextField.text = formatter.stringFromDate(sender.date)
    }
    func datePickerChangedLoadIn(sender: UIDatePicker){

        let rawTime = sender.countDownDuration
        let totalMinutes = rawTime / 60

        if totalMinutes >= 60 {

            let hours = Int(totalMinutes / 60)
            let minutes = Int(totalMinutes % 60)

            loadInTextField.text = "\(hours) hours and \(minutes) minutes before show"

        } else if totalMinutes < 60 {

            let minutes = Int(totalMinutes)

            loadInTextField.text = "\(minutes) minutes before"
        }
    }
    func datePickerChangedSetDuration(sender: UIDatePicker){

        let rawTime = sender.countDownDuration
        let totalMinutes = rawTime / 60

        if totalMinutes >= 60 {

            let hours = Int(totalMinutes / 60)
            let minutes = Int(totalMinutes % 60)

            setDurationTextField.text = "\(hours) hour and \(minutes) minutes"

        } else if totalMinutes < 60 {

            let minutes = Int(totalMinutes)

            setDurationTextField.text = "\(minutes) minutes"
        }

    }

    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {

        titleTextField.hidden = false
        titleTextField.becomeFirstResponder()
        collectionView.hidden = true


    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! BandImageCollectionViewCell

        cell.bandName.text = "The Overeasy"
        cell.bandGenre.text = "Funk/Rock"
//        cell?.bandImage.image = // band image here


        return cell
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 3

        // count of array in the future
    }

    @IBAction func nextButtonPressed(sender: AnyObject) {

        switch (1 > 0) {

        case titleTextField.text != "":
            titleTextField.hidden = true
            DataController.saveDataToNSUserDefaults(titleTextField.text, key: "title")
            titleTextField.text?.removeAll()
            venueTextField.hidden = false
            venueTextField.becomeFirstResponder()
            break
        case venueTextField.text != "":
            venueTextField.hidden = true
            DataController.saveDataToNSUserDefaults(venueTextField.text, key: "venue")
            venueTextField.text?.removeAll()
            compensationTextField.hidden = false
            compensationTextField.becomeFirstResponder()
            break
        case compensationTextField.text != "":
            compensationTextField.hidden = true
            DataController.saveDataToNSUserDefaults(compensationTextField.text, key: "compensation")
            compensationTextField.text?.removeAll()
            dateTextField.hidden = false
            dateTextField.becomeFirstResponder()
            break
        case dateTextField.text != "":
            dateTextField.hidden = true
            DataController.saveDataToNSUserDefaults(dateTextField.text, key: "date")
            dateTextField.text?.removeAll()
            timeTextField.hidden = false
            timeTextField.becomeFirstResponder()
            break
        case timeTextField.text != "":
            timeTextField.hidden = true
            DataController.saveDataToNSUserDefaults(timeTextField.text, key: "time")
            timeTextField.text?.removeAll()
            setDurationTextField.hidden = false
            setDurationTextField.becomeFirstResponder()
            break
        case setDurationTextField.text != "":
            setDurationTextField.hidden = true
            DataController.saveDataToNSUserDefaults(setDurationTextField.text, key: "setDuration")
            setDurationTextField.text?.removeAll()
            loadInTextField.hidden = false
            loadInTextField.becomeFirstResponder()
            break
        case loadInTextField.text != "":
            loadInTextField.hidden = true
            DataController.saveDataToNSUserDefaults(loadInTextField.text, key: "loadIn")
            loadInTextField.text?.removeAll()
            detailTextView.hidden = false
            detailTextView.becomeFirstResponder()
            break
        case detailTextView.text != "":
            detailTextView.hidden = true
            DataController.saveDataToNSUserDefaults(detailTextView.text, key: "detail")
            detailTextView.text?.removeAll()
            performSegueWithIdentifier("toConfirmGigSubmissionViewController", sender: nil)

            break


        default:
            break;
        }
    }

}

extension GigSubmissionViewController: GMSAutocompleteViewControllerDelegate {

    // Handle the user's selection.
    func viewController(viewController: GMSAutocompleteViewController, didAutocompleteWithPlace place: GMSPlace) {

        venueTextField.text = place.name
        DataController.saveDataToNSUserDefaults(place.placeID, key: "placeID") 
        DataController.saveDataToNSUserDefaults(place.phoneNumber, key: "phoneNumber")
        DataController.saveDataToNSUserDefaults(place.formattedAddress, key: "address")
        DataController.saveDataToNSUserDefaults(ConversionController.convertLongitudeCoordinateToString(place.coordinate), key: "longitude")
        DataController.saveDataToNSUserDefaults(ConversionController.convertLatitudeCoordinateToString(place.coordinate), key: "latitude")
        self.dismissViewControllerAnimated(true, completion: nil)

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







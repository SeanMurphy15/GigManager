//
//  GigSubmissionViewController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/10/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import UIKit

class GigSubmissionViewController: UIViewController, UITextFieldDelegate{

    var gigSubmissionDictionary: [String:AnyObject] = [:]



    @IBOutlet weak var detailTextView: UITextView!

    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var venueTextField: UITextField!

    @IBOutlet weak var compensationTextField: UITextField!

    @IBOutlet weak var timeTextField: UITextField!

    @IBOutlet weak var dateTextField: UITextField!

    @IBOutlet weak var loadInTextField: UITextField!

    @IBOutlet weak var setDurationTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        dateTextField.delegate = self
        loadInTextField.delegate = self
        timeTextField.delegate = self
        setDurationTextField.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


    @IBAction func nextButtonPressed(sender: AnyObject) {

        switch (1 > 0) {

        case titleTextField.text != "":
            titleTextField.hidden = true
            gigSubmissionDictionary["title"] = titleTextField.text
            titleTextField.text?.removeAll()
            venueTextField.hidden = false
            break
        case venueTextField.text != "":
            venueTextField.hidden = true
            gigSubmissionDictionary["venue"] = venueTextField.text
            venueTextField.text?.removeAll()
            compensationTextField.hidden = false
            break
        case compensationTextField.text != "":
            compensationTextField.hidden = true
            gigSubmissionDictionary["compensation"] = compensationTextField.text
            compensationTextField.text?.removeAll()
            dateTextField.hidden = false
            break
        case dateTextField.text != "":
            dateTextField.hidden = true
            gigSubmissionDictionary["date"] = dateTextField.text
            dateTextField.text?.removeAll()
            timeTextField.hidden = false
            break
        case timeTextField.text != "":
            compensationTextField.hidden = true
            gigSubmissionDictionary["time"] = timeTextField.text
            timeTextField.text?.removeAll()
            setDurationTextField.hidden = false
            break
        case setDurationTextField.text != "":
            setDurationTextField.hidden = true
            gigSubmissionDictionary["setDuration"] = setDurationTextField.text
            setDurationTextField.text?.removeAll()
            loadInTextField.hidden = false
            break
        case loadInTextField.text != "":
            loadInTextField.hidden = true
            gigSubmissionDictionary["loadIn"] = loadInTextField.text
            loadInTextField.text?.removeAll()
            detailTextView.hidden = false
            break
        case detailTextView.text != "":
            detailTextView.hidden = true
            gigSubmissionDictionary["detail"] = detailTextView.text
            detailTextView.text?.removeAll()
            print("submission complete")
            break

        default:
            break;
        }
        print(gigSubmissionDictionary)
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
            datePicker.datePickerMode = UIDatePickerMode.Time
            textField.inputView = datePicker
            datePicker.addTarget(self, action: "datePickerChangedLoadIn:", forControlEvents: .ValueChanged)
            break;

        case setDurationTextField:

            let datePicker:UIDatePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.CountDownTimer
            textField.inputView = datePicker
            datePicker.addTarget(self, action: "datePickerChangedSetDuration:", forControlEvents: .ValueChanged)
            break;

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

        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        loadInTextField.text = formatter.stringFromDate(sender.date)
    }
    func datePickerChangedSetDuration(sender: UIDatePicker){

        let rawTime = sender.countDownDuration
        let totalMinutes = rawTime / 60

        if totalMinutes >= 60 {

            let hours = Int(totalMinutes / 60)
            let minutes = Int(totalMinutes % 60)

            setDurationTextField.text = "\(hours) hours and \(minutes) minutes "

        } else if totalMinutes < 60 {

            let minutes = Int(totalMinutes)

            setDurationTextField.text = "\(minutes) minutes"
        }

    }
    
}







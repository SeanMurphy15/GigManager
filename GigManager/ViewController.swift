//
//  ViewController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/6/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.


    }
    
    @IBAction func buttonPressed(sender: AnyObject) {

        label.text = textField.text

        
    }



}

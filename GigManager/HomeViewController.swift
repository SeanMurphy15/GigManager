//
//  HomeViewController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/6/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {




    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

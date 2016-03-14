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

        BandController.fetchGigsForBand("-KCnJ37byiaPTZJZ2-OX") { (success, error, gigs) -> Void in

            if success {

                print(gigs)

            } else {

                print(error?.localizedDescription)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

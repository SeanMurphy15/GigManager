//
//  AddBandViewController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/13/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import UIKit

class AddBandViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var bandNameTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MemberCollectionViewCell

        cell.memberName.text = "Sean Murphy"
        cell.memberSkill.text = "Guitar"
        cell.imageView.image = UIImage(named: "profile-picture")

        
        return cell
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("add member")
    }

    

    @IBAction func submitButtonPressed(sender: AnyObject) {


        switch (1 > 0) {
        case bandNameTextField.text == "":
            print("band name is empty")
            break
        case genreTextField.text == "":
            print("genre is empty")
            break
        case descriptionTextView.text == "":
            print("description is empty")
            break
        default:

            BandController.createBand(bandNameTextField.text!, genre: genreTextField.text!, description: descriptionTextView.text, completion: { (success, error, var band) -> Void in

                if success {

                    band?.save()

                    print("band request saved")


                } else {

                    print("\(error?.localizedDescription)")
                }
            })
            break;
        }
        
    }

    
}

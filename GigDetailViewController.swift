//
//  GigDetailViewController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/6/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import UIKit

class GigDetailViewController: UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("memberCell", forIndexPath: indexPath) as! MemberImageCollectionViewCell

        // let image = [indexPath.item]

        cell.memberImage.image = UIImage(named: "venops-mobile-app-icon-demo")

        return cell

    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {



    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }

}

//
//  BandController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/13/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import Foundation
import Firebase


class BandController {

    var ref = Firebase(url: "https://gigmanager.firebaseio.com/")


    static func createBand(name: String, genre: String, description: String, completion:(success: Bool, error: NSError?, band: Band?)->Void){

        let error = NSError?()

        if (error != nil){

            completion(success: false, error: error, band: nil)

        } else {

            let band = Band(name: name, genre: genre, description: description)

            completion(success: true, error: nil, band: band)

        }


    }

    static func fetchGigsForBand(bandIdentifier: String, completion: (success: Bool, error: NSError?, gigs:[String:String]) -> Void){

        let error = NSError?()

        let ref = Firebase(url: "https://gigmanager.firebaseio.com/gigs")

        ref.queryOrderedByChild("bandIdentifier").queryEqualToValue(bandIdentifier).observeEventType(.ChildAdded, withBlock: { snapshot in


            if let gigDictionary = snapshot.value as? [String:String] {


                    completion(success: true,error: nil, gigs: gigDictionary)
                    
                } else {
                    
                completion(success: false, error: error, gigs: [:])

            }

        })
    }

    static func addMemberToBand(bandIdentifier: String){

        let ref = Firebase(url: "https://gigmanager.firebaseio.com/bands/\(bandIdentifier)/members")

        if let memberRef = ref.childByAutoId(){

            memberRef.setValue("sean murphy")

        } else {

            print("nope")
        }
    }
    
}
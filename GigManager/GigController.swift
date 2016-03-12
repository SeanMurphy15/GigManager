//
//  LocationController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/4/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import Foundation
import Firebase


class GigController{

var ref = Firebase(url: "https://gigmanager.firebaseio.com/")


    static func createGig(title: String?, placeIdentifier: String?, compensation: String?, detail: String?, longitude: String?, latitude: String?, address: String?, venue: String?, confirmed: String?, date: String?, loadIn: String?, setDuration: String?, bandIdentifier: String?, completion: (success: Bool, error: NSError?)->Void){

        let error = NSError?()

        if title == nil || date == nil {

            completion(success: false, error: error)

        } else {

            completion(success: true, error: nil)
        }

    }


}

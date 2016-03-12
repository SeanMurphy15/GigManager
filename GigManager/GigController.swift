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


    static func createGig(title: String?, compensation: String?, setDuration: String?, date: String?,venue: String?, loadIn: String?, details: String?, completion: (success: Bool, error: NSError?, gig: Gig?)->Void){

        var error = NSError?()

        

    }


}

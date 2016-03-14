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




    static func createGig(title: String?, placeIdentifier: String?, compensation: String?, detail: String?, longitude: String?, latitude: String?, address: String?, venue: String?, confirmed: String?, date: String?, loadIn: String?, setDuration: String?, bandIdentifier: String?, completion: (success: Bool, error: NSError?, gig: Gig?)->Void){

        let error = NSError?()

        if (error != nil) {

            completion(success: false, error: error, gig: nil)

        } else {

            let gig = Gig(title: title, placeIdentifier: placeIdentifier, compensation: compensation, detail: detail, longitude: longitude, latitude: latitude, address: address, venue: venue, confirmed: confirmed, date: date, loadIn: loadIn, setDuration: setDuration, bandIdentifier: bandIdentifier)

            completion(success: true, error: nil, gig: gig)
        }

    }

}

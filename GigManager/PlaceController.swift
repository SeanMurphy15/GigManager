//
//  LocationController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/4/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import Foundation


class PlaceController{


    static func createPlace(name name: String, identifier: String?, coordinates: CLLocationCoordinate2D, address: String, type: [String], completion:(success: Bool, place: Place?, error: NSError?)->Void){

        let error = NSError?()

        if identifier != nil{

            let place = Place(name: name, identifier: identifier!, coordinates: coordinates, address: address, type: type)

            completion(success: true, place: place, error: nil)

        } else {

            completion(success: false, place: nil, error: error)
        }
        
        
        
    }


}

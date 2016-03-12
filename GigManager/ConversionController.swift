//
//  ConversionController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/11/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import Foundation


class ConversionController{

    static func convertLongitudeCoordinateToString(coordinate: CLLocationCoordinate2D) -> String?{

        let rawLongitude = coordinate.longitude

        if let longitude : String = String(format:"%f", rawLongitude) {

            return longitude
        }

        return nil
    }

    static func convertLatitudeCoordinateToString(coordinate: CLLocationCoordinate2D) -> String?{

        let rawLatitude = coordinate.latitude

        if let latitude : String = String(format:"%f", rawLatitude) {

            return latitude
        }

        return nil
    }

    static func convertNSURLToString(url: NSURL) -> String?{

        if let urlString : String = String(format:"%f", url) {
            
            return urlString
        }
        
        return nil
    }
}

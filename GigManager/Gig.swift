//
//  Place.swift
//  GigManager
//
//  Created by Sean Murphy on 3/4/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import Foundation
import MapKit


class Gig: Equatable, FirebaseType{

    private let titleKey                = "title"
    private let placeIdentifierKey      = "placeIdentifier"
    private let compensationKey         = "compensation"
    private let detailKey               = "detail"
    private let longitudeKey            = "longitude"
    private let latitudeKey             = "latitude"
    private let addressKey              = "address"
    private let venueKey                = "venue"
    private let confirmedKey            = "confirmed"
    private let dateKey                 = "date"
    private let loadInKey               = "loadIn"
    private let setDurationKey          = "setDuration"
    private let bandIdentifierKey       = "bandIdentifier"

    var title: String?
    var placeIdentifier: String?
    var compensation: String?
    var detail: String?
    var longitude: String?
    var latitude: String?
    var address: String?
    var venue: String?
    var confirmed: String?
    var date: String?
    var loadIn: String?
    var setDuration: String?
    var bandIdentifier: String?
    var identifier: String?
    var endpoint: String {
        return "gigs"
    }
    var jsonValue: [String: AnyObject] {

        var json: [String: AnyObject] = [titleKey: title!]


        if let placeIdentifier = placeIdentifier {
            json.updateValue(placeIdentifier, forKey: placeIdentifierKey)
        }
        if let detail = detail {
            json.updateValue(detail, forKey: detailKey)
        }
        if let longitude = longitude {
            json.updateValue(longitude, forKey: longitudeKey)
        }
        if let latitude = latitude {
            json.updateValue(latitude, forKey: latitudeKey)
        }
        if let address = address {
            json.updateValue(address, forKey: addressKey)
        }
        if let venue = venue {
            json.updateValue(venue, forKey: venueKey)
        }
        if let confirmed = confirmed {
            json.updateValue(confirmed, forKey: confirmedKey)
        }
        if let date = date {
            json.updateValue(date, forKey: dateKey)
        }
        if let loadIn = loadIn {
            json.updateValue(loadIn, forKey: loadInKey)
        }
        if let setDuration = setDuration {
            json.updateValue(setDuration, forKey: setDurationKey)
        }
        if let bandIdentifier = bandIdentifier {
            json.updateValue(bandIdentifier, forKey: bandIdentifierKey)
        }


        return json
    }

    required init?(json: [String: AnyObject], identifier: String) {

        guard let title = json[titleKey] as? String else { return nil }

        self.title = title
        self.placeIdentifier = json[placeIdentifierKey] as? String
        self.compensation = json[compensationKey] as? String
        self.detail = json[detailKey] as? String
        self.longitude = json[longitudeKey] as? String
        self.latitude = json[latitudeKey] as? String
        self.address = json[addressKey] as? String
        self.venue = json[venueKey] as? String
        self.confirmed = json[confirmedKey] as? String
        self.date = json[dateKey] as? String
        self.address = json[addressKey] as? String
        self.loadIn = json[loadInKey] as? String
        self.setDuration = json[setDurationKey] as? String
        self.bandIdentifier = json[bandIdentifierKey] as? String
        self.identifier = identifier
    }

    init(title: String?, placeIdentifier: String?, compensation: String?, detail: String?, longitude: String?, latitude: String?, address: String?, venue: String?, confirmed: String?, date: String?, loadIn: String?, setDuration: String?, bandIdentifier: String?){

        self.title = title
        self.placeIdentifier = placeIdentifier
        self.compensation = compensation
        self.detail = detail
        self.longitude = longitude
        self.latitude = latitude
        self.address = address
        self.venue = venue
        self.confirmed = confirmed
        self.date = date
        self.loadIn = loadIn
        self.setDuration = setDuration
        self.bandIdentifier = bandIdentifier
    }
    
}

func == (lhs: Gig, rhs: Gig) -> Bool {

    return (lhs.title == rhs.title) && (lhs.identifier == rhs.identifier)
}

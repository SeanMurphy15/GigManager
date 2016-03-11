//
//  Member.swift
//  GigManager
//
//  Created by Sean Murphy on 3/7/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import Foundation

class Member {

    var name: String?
    var placeIdentifier: String?
    var coordinates: CLLocationCoordinate2D?
    var address: String?
    var type: [String]
    var confirmed: String?
    var date: NSDate?
    var loadIn: NSDate?
    var members: [Member]

    init(name: String, identifier: String, coordinates: CLLocationCoordinate2D, address: String, type: [String], confirmed: String?, date: NSDate?, loadIn: NSDate?, members: [Member]){

        self.name = name
        self.placeIdentifier = identifier
        self.coordinates = coordinates
        self.address = address
        self.type = type
        self.confirmed = confirmed
        self.date = date
        self.loadIn = loadIn
        self.members = members

    }
}
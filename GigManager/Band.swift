//
//  Member.swift
//  GigManager
//
//  Created by Sean Murphy on 3/7/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import Foundation
import Firebase

class Band: Equatable, FirebaseType {

    private let nameKey =                 "name"
    private let genreKey =                "genre"
    private let descriptionKey =          "description"


    var name = ""
    var genre: String?
    var description: String?
    var identifier: String?
    var endpoint: String {
        return "bands"
    }

    var jsonValue: [String: AnyObject] {

        var json: [String: AnyObject] = [nameKey : name]

        if let genre = genre {
            json.updateValue(genre, forKey: genreKey)
        }
        if let description = description {
            json.updateValue(description, forKey: descriptionKey)
        }
        return json
    }

    required init?(json: [String: AnyObject], identifier: String) {

        guard let name = json[nameKey] as? String else { return nil }

        self.genre = json[genreKey] as? String
        self.description = json[descriptionKey] as? String
        self.identifier = identifier
    }

    init(name: String, genre: String, description: String){

        self.name = name
        self.genre = genre
        self.description = description


    }
}

func == (lhs: Band, rhs: Band) -> Bool {

    return (lhs.name == rhs.name) && (lhs.identifier == rhs.identifier)
}
//
//  NetworkController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/4/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import Foundation

class NetworkController {

    static func baseURL(searchTerm:String) -> NSURL {
        let modifiedSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+")
        return NSURL(string: "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(modifiedSearchTerm)&key=AIzaSyDFGGXRVVljrLHmVhgfC5dVgqv4uB7LWdE")!
    }



    static func dataAtURL(url:NSURL, completion:(resultData:NSData?) -> Void){

        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            }
            completion(resultData: data)
        }
        dataTask.resume()
    }



}

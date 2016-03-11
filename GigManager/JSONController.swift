//
//  PlaceController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/4/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import Foundation


class JSONController {


    static func searchForPlaces(searchTerm:String, completion:(success:Bool) -> Void){

        let url = NetworkController.baseURL(searchTerm)

        NetworkController.dataAtURL(url) { (resultData) -> Void in

            // Checking for ResultData
            guard let data = resultData else {
                print("No Data Returned")
                completion(success: false)
                return
            }

            do {
                let resultsAnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)

                if let resultsDictionary = resultsAnyObject as? [String:AnyObject] {
                    if let resultsArray = resultsDictionary["results"] as? [[String:AnyObject]]
                    {

                        print(resultsArray)
                        completion(success: true)
                    } else {
                        completion(success: false)
                    }
                }
            } catch {
                completion(success: false)
            }
        }
    }
}
//
//  DataController.swift
//  GigManager
//
//  Created by Sean Murphy on 3/12/16.
//  Copyright © 2016 Sean Murphy. All rights reserved.
//

import Foundation


class DataController {


    static func saveDataToNSUserDefaults(data: String?, key: String){

        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(data, forKey: key)
    }

    static func fetchDataFromNSUserDefaults(key: String) -> String?{

        let defaults = NSUserDefaults.standardUserDefaults()
        if let userData = defaults.valueForKey(key)
        {
            return userData as? String
        }

        return nil
    }

    static func deleteAllDataFromNSUserDefaults(){

        for key in NSUserDefaults.standardUserDefaults().dictionaryRepresentation().keys {
            NSUserDefaults.standardUserDefaults().removeObjectForKey(key)
        }
    }

    static func deleteDataObjectFromNSUserDefaults(dataObject: String){

        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey(dataObject)
    }
}
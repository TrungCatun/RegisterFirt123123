//
//  DataService.swift
//  RegisterFirt
//
//  Created by Trung on 10/25/18.
//  Copyright © 2018 TrungCatun. All rights reserved.
//

import Foundation
struct GetCity {
    var name: String
    var codeCity: Int
    
    init(name: String, codeCity: Int) {
        self.name = name
        self.codeCity = codeCity
    }
}


class DataService {
//    static let share = DataService()
    
    
    
    class func getCityOfPlist() -> [GetCity] {
        var cities: [GetCity] = []
        
        if let path = Bundle.main.path(forResource: "Cities", ofType: "plist"),
            let dictionaryCity = NSDictionary(contentsOfFile: path) as? Dictionary<AnyHashable, Any> {
            if let arrayCity = dictionaryCity["Cities"] as? [Dictionary<AnyHashable, Any>] {
            
            for city in arrayCity {
                let cityOnce = GetCity(name: city["Name"] as! String,
                                       codeCity: city["CityCode"] as! Int)
                cities.append(cityOnce)
                }
            }
        }
        return cities
    }
}

//
//  CountryModel.swift
//  CountryApiMVVM
//
//  Created by Ady on 10/2/18.
//  Copyright © 2018 RJTCompuquest. All rights reserved.
//

import Foundation

struct JSONCountry : Codable{
    var Response : [Country]
}


struct Country : Codable{
    var Name : String
    var Alpha2Code : String
    var Alpha3Code : String
    var NativeName : String
    var Region : String
    var SubRegion : String
    var Latitude : String
    var Longitude : String
    var area : Int?
    var numericCode : Int?
    var NativeLanguage : String
    var CurrencyCode : String
    var CurrencyName : String
    var CurrencySymbol: String
    var Flag : String
    var FlagPng : String
}

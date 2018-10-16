//
//  NetworkManager.swift
//  CountryApiMVVM
//
//  Created by Ady on 10/2/18.
//  Copyright © 2018 RJTCompuquest. All rights reserved.
//

import Foundation

let countryAPI = "http://countryapi.gear.host/v1/Country/getCountries"


class NetworkManager:NSObject {
    
    private override init() {}
    static let sharedInstance = NetworkManager()
    
    
    
    func getCountryData(completion: @escaping ([Country], Error?) -> ()){
        
        let url = URL(string: countryAPI)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                let decoder = JSONDecoder()
                do{
                    let country = try decoder.decode(JSONCountry.self, from: data!)
                    DispatchQueue.main.async {
                        completion(country.Response, nil)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }else{
                completion([], error)
            }
        }.resume()
    }
    
    
}

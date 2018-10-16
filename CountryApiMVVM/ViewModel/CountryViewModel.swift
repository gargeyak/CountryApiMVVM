//
//  CountryViewModel.swift
//  CountryApiMVVM
//
//  Created by Ady on 10/2/18.
//  Copyright © 2018 RJTCompuquest. All rights reserved.
//

import UIKit
import SDWebImage

class CountryViewModel:NSObject, UITableViewDataSource, UITableViewDelegate{

    var country : JSONCountry?
    var countryArr: [Country] = []
    
    
    func countryAPI(completion: @escaping () -> () ){
        NetworkManager.sharedInstance.getCountryData { (countryArr, error) in
            if error ==  nil{
                self.countryArr = countryArr
                completion()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as? CountryTableViewCell
        let dict = countryArr[indexPath.row]
        cell?.countryNameLbl?.text = dict.Name
        cell?.regionLbl?.text = dict.Region
        cell?.flagImgView.sd_setImage(with: URL(string: dict.FlagPng))
        
//        DispatchQueue.global().async {
//            if let imageUrl = URL(string: dict.FlagPng){
//                do{
//                    let data = try Data.init(contentsOf: imageUrl)
//                    DispatchQueue.main.async {
//                        cell?.flagImgView.image = UIImage(data: data)
//                    }
//                }catch{
//                    print(error.localizedDescription)
//                }
//            }
//        }
        
        return cell!
    }
    
}


    

    


//
//  ViewController.swift
//  CountryApiMVVM
//
//  Created by Ady on 10/2/18.
//  Copyright © 2018 RJTCompuquest. All rights reserved.
//

import UIKit


class CountryViewController: UIViewController {

    var viewModel = CountryViewModel()
   
    
     @IBOutlet weak var countryTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateTblView()
        
        title = "CountryInfo"
        
        countryTblView.dataSource = viewModel
        countryTblView.delegate = viewModel
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    
    func updateTblView(){
        viewModel.countryAPI {
            DispatchQueue.main.async {
                self.countryTblView.reloadData()
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


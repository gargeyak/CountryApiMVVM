//
//  CountryApiMVVMTests.swift
//  CountryApiMVVMTests
//
//  Created by Ady on 10/2/18.
//  Copyright © 2018 RJTCompuquest. All rights reserved.
//

import XCTest
@testable import CountryApiMVVM

class CountryApiMVVMTests: XCTestCase {
    
//    var countryViewController: CountryViewController!
    var countryViewModel: CountryViewModel!
    var tablview: UITableView!
    var tableViewData:[Country] = [Country(Name: "One", Alpha2Code: "One", Alpha3Code: "One", NativeName: "One", Region: "One", SubRegion: "One", Latitude: "One", Longitude: "One", area: 1, numericCode: 12, NativeLanguage: "One", CurrencyCode: "One", CurrencyName: "One", CurrencySymbol: "One", Flag: "One", FlagPng: "One"), Country(Name: "Two", Alpha2Code: "Two", Alpha3Code: "Two", NativeName: "Two", Region: "Two", SubRegion: "Two", Latitude: "Two", Longitude: "Two", area: 2, numericCode: 22, NativeLanguage: "Two", CurrencyCode: "Two", CurrencyName: "Two", CurrencySymbol: "Two", Flag: "Two", FlagPng: "Two")]

    override func setUp() {
        countryViewModel = CountryViewModel()
        countryViewModel.countryArr = tableViewData
        tablview = UITableView()
        tablview.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryTableViewCell")
    
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        countryViewModel = nil
        tablview = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testAsyncNetworkCall() {
        
        let expectationRes = expectation(description: "async network call test")
        let networkHandler = NetworkManager.sharedInstance
        networkHandler.getCountryData { (response, error) in
            if error == nil{
                expectationRes.fulfill()
            }else{
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testNumberOfRows() {
        
        let numberOfRows = countryViewModel.tableView(tablview, numberOfRowsInSection: 0)
        XCTAssert(numberOfRows == 2, "\n FailingCase \n")
    }
    
    func testCellForRow(){
        
        let index = IndexPath(row: 0, section: 0)
        let cell = countryViewModel.tableView(tablview, cellForRowAt: index) as? CountryTableViewCell
        XCTAssertTrue(cell != nil)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

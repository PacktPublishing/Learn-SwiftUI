//
//  My_Favourite_RecipesTests.swift
//  My Favourite RecipesTests
//
//  Created by Chris Barker on 26/02/2020.
//  Copyright © 2020 Packt. All rights reserved.
//

import XCTest
@testable import My_Favourite_Recipes


class My_Favourite_RecipesTests: XCTestCase {

    override func setUp() {
    }

    func testIfGetCountriesHasItems() {
        XCTAssertTrue(Helper.getCountries().count > 0)
        XCTAssertGreaterThan(Helper.getCountries().count, 0)
    }
    
    func testThatGetCoordinatesReturnsCorrectLatLon() {
        let locationOne = Helper.getCoordinates(country: "Spain")
        XCTAssertEqual(locationOne.latitude, 41.383)
        XCTAssertEqual(locationOne.longitude, 2.183)
        
        let locationTwo = Helper.getCoordinates(country: "UK")
        XCTAssertEqual(locationTwo.latitude, 53.483959)
        XCTAssertEqual(locationTwo.longitude, -2.244644)
    }

}

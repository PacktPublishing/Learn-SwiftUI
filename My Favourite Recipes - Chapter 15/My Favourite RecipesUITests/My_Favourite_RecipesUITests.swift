//
//  My_Favourite_RecipesUITests.swift
//  My Favourite RecipesUITests
//
//  Created by Chris Barker on 25/02/2020.
//  Copyright © 2020 Packt. All rights reserved.
//

import XCTest

class My_Favourite_RecipesUITests: XCTestCase {
    
let app = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }
    
    func testCanTapMapButton() {
        app.buttons["accessibility.map.button"].tap()
    }
    
    func testCanTapFilterButton() {
        app.buttons["accessibility.filter.button"].tap()
    }
    
    func testCanTapAddButton() {
        app.buttons["accessibility.add.button"].tap()
    }
    
    func testCanAddRecipeImage() {
        testCanTapAddButton()
        app.buttons["accessibility.add.image.button"].tap()
    }
    
    func testCanAddRecipeName() {
        testCanTapAddButton()
        let textField = app.textFields["accessibility.name.textfield"]
        textField.tap()
        textField.typeText("My First Recipe")
    }
    
    func testAddIngredientsAddsToList() {
        testCanTapAddButton()
        
        let textField = app.textFields["accessibility.ingredient.textfield"]
        textField.tap()
        textField.typeText("Milk")
        app.buttons["accessibility.ingredient.add.button"].tap()
        
        XCTAssertTrue(app.staticTexts["accessibility.ingredient.list"].exists)
    }

}

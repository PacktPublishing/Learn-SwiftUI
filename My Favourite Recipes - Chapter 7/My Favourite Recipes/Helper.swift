//
//  Helper.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 10/12/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import UIKit
import SwiftUI

struct Helper {

    static func saveRecipes(recipes: [RecipeModel]) {
        let data = try! JSONEncoder().encode(recipes)
        UserDefaults.standard.set(data, forKey: "recipes")
    }
        
    // Gets List of Saved Recipes
    static func getRecipes(filter: String = "") -> [RecipeModel] {
                
        if let data = UserDefaults.standard.data(forKey: "recipes") {
            var array = try! JSONDecoder().decode([RecipeModel].self, from: data)
            
            // Apply filter
            if filter != "" {
                array = array.filter { $0.origin == filter }
            }
            
            return array
        }
        return [RecipeModel]()
    }
    
    // Gets list of mock data Recipes to be injected into our app.
    static func mockRecipes() -> [RecipeModel] {
        
        var recipies = [RecipeModel]()
        recipies.append(RecipeModel(name: "Italian Pizza Chicken", origin: "Italy", countryCode: "IT", ingredients: getMockIngredients(), recipe: getMockRecipe()))
        recipies.append(RecipeModel(name: "Greek Pasta Bake", origin: "Greece", countryCode: "GR", ingredients: getMockIngredients(), recipe: getMockRecipe()))
        recipies.append(RecipeModel(name: "Hearty Parsnip Soup", origin: "UK", countryCode: "GB", ingredients: getMockIngredients(), recipe: getMockRecipe()))
        recipies.append(RecipeModel(name: "Honey & Soy Salmon", origin: "China", countryCode: "CN", ingredients: getMockIngredients(), recipe: getMockRecipe()))
        
        recipies.append(contentsOf: getRecipes())
        
        return recipies
        
    }
    
    private static func getMockIngredients() -> [String] {
        return ["1 x Ingredient One",
                "2tbp Ingredient Two",
                "500g Ingredient Three",
                "2 x Ingredient Four"]
    }
    
    private static func getMockRecipe() -> String {
        return "Bacon ipsum dolor amet ad frankfurter pork aute nostrud leberkas jowl tenderloin dolore beef ribs. Ex tempor shankle, venison in ut cow deserunt. Do swine andouille, minim quis excepteur non shank eiusmod id buffalo. Duis shankle chuck picanha cow id minim esse. Qui burgdoggen capicola, venison culpa labore pastrami est minim bacon enim.\n\nExcepteur lorem turducken aute, qui ad hamburger chicken buffalo chislic brisket cupidatat pariatur. Jowl fugiat picanha pork belly quis. Ad shankle chuck est tri-tip ribeye sunt. Venison turkey tempor, occaecat beef biltong ut pork. Frankfurter sunt ad buffalo short loin cupidatat ipsum strip steak short ribs. Tri-tip porchetta fatback deserunt aute ut. Laborum nostrud aliquip pancetta deserunt, esse laboris pastrami."
    }
    
    static func getCountries() -> [String] {
        return ["Italy", "Greece", "UK", "China", "France", "USA", "Mexico", "Spain"]
    }
    
    static func getCountryCode(country: String) -> String {
        switch country {
        case "Italy":
            return "IT"
        case "Greece":
            return "GR"
        case "UK":
            return "GB"
        case "China":
            return "CN"
        case "Mexico":
            return "MX"
        case "France":
            return "FR"
        case "USA":
            return "US"
        case "Spain":
            return "ES"
        default:
            return ""
        }
    }
    
}

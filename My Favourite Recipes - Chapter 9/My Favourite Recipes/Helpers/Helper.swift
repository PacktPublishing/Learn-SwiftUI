//
//  Helper.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 10/12/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import UIKit
import SwiftUI
import MapKit

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
        recipies.append(RecipeModel(name: "Italian Pizza Chicken", origin: "Italy", countryCode: "IT", favourite: false, ingredients: getMockIngredients(), recipe: getMockRecipe(), imageData: Data()))
        recipies.append(RecipeModel(name: "Greek Pasta Bake", origin: "Greece", countryCode: "GR", favourite: false, ingredients: getMockIngredients(), recipe: getMockRecipe(), imageData: Data()))
        recipies.append(RecipeModel(name: "Hearty Parsnip Soup", origin: "UK", countryCode: "GB", favourite: false, ingredients: getMockIngredients(), recipe: getMockRecipe(), imageData: Data()))
        recipies.append(RecipeModel(name: "Honey & Soy Salmon", origin: "China", countryCode: "CN", favourite: false, ingredients: getMockIngredients(), recipe: getMockRecipe(), imageData: Data()))
        
        //recipies.append(contentsOf: getRecipes())
        
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
    
    static func getMockLocations()-> [AnnotationPin] {
        
        var annotations = [AnnotationPin]()
        
        annotations.append(AnnotationPin(title: "Recipe One",
                                         subtitle: "San Jose",
                                         coordinate: CLLocationCoordinate2D(latitude: 37.3327177, longitude: -122.0753671)))
        
        annotations.append(AnnotationPin(title: "Recipe Two",
                                         subtitle: "San Francisco",
                                         coordinate: CLLocationCoordinate2D(latitude: 37.6160179, longitude: -122.3946882)))
        
        return annotations
        
    }
    
    private static func getCoordinates(country: String) -> CLLocationCoordinate2D {
        switch country {
        case "Italy":
            return CLLocationCoordinate2D(latitude: 43.112221, longitude: 12.388889)
        case "Greece":
            return CLLocationCoordinate2D(latitude: 37.983810, longitude: 23.727539)
        case "UK":
            return CLLocationCoordinate2D(latitude: 53.483959, longitude: -2.244644)
        case "China":
            return CLLocationCoordinate2D(latitude: 31.224361, longitude: 121.469170)
        case "France":
            return CLLocationCoordinate2D(latitude: 48.864716, longitude: 2.349014)
        case "USA":
            return CLLocationCoordinate2D(latitude: 40.000000, longitude: -89.000000)
        case "Mexico":
            return CLLocationCoordinate2D(latitude: 19.451054, longitude: -99.125519)
        case "Spain":
            return CLLocationCoordinate2D(latitude: 41.383, longitude: 2.183)
        default:
            return CLLocationCoordinate2D(latitude: 37.6160179, longitude: -122.3946882)
        }
    }
    
    static func getRecipeLocations() -> [AnnotationPin] {
        var locations = [AnnotationPin]()
        
        let recipes = getRecipes()
        
        let countries = Set(recipes.map{$0.origin})
        
        for country in countries {
            let count = recipes.filter {$0.origin == country }.count
            let subtitle = count > 1 ? "\(count) Recipes" : "\(count) Recipe"
            locations.append(AnnotationPin(title: country, subtitle: subtitle, coordinate: Helper.getCoordinates(country: country)))
        }
        return locations
    }
    
}

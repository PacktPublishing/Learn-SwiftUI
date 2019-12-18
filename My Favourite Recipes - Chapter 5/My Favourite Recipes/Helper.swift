//
//  Helper.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 10/12/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import UIKit

struct Helper {

    // Checks if recipe is already a Favourite
    static func isFavourite(name: String) -> Bool {
        return getFavourites().contains(where: {($0.name == name)})
    }
    
    // Adds or Removes Recipe from Favourites
    static func addRemoveFavourite(recipe: RecipeModel) {
        
        var favourites = getFavourites()
        if !isFavourite(name: recipe.name) {
            favourites.append(recipe)
        } else {
            favourites.removeAll(where: { $0.name == recipe.name })
        }
        
        let data = try! JSONEncoder().encode(favourites)
        UserDefaults.standard.set(data, forKey: "favourites")
        
    }
    
    // Gets List of Favourite Recipes
    static func getFavourites() -> [RecipeModel] {
        if let data = UserDefaults.standard.data(forKey: "favourites") {
            let array = try! JSONDecoder().decode([RecipeModel].self, from: data)
            return array
        }
        return [RecipeModel]()
    }
    
    // Gets list of mock data Recipes to be injected into our app.
    static func mockRecipes() -> [RecipeModel] {
        
        var recipies = [RecipeModel]()
        recipies.append(RecipeModel(name: "Italian Pizza Chicken", origin: "Italian", countryCode: "IT"))
        recipies.append(RecipeModel(name: "Greek Pasta Bake", origin: "Greek", countryCode: "GR"))
        recipies.append(RecipeModel(name: "Hearty Parsnip Soup", origin: "British", countryCode: "GB"))
        recipies.append(RecipeModel(name: "Honey & Soy Salmon", origin: "Chinese", countryCode: "CN"))
        
        return recipies
        
    }
    
}

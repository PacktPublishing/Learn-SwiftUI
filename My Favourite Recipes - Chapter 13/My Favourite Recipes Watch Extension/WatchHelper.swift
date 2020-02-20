//
//  WatchHelper.swift
//  My Favourite Recipes Watch Extension
//
//  Created by Chris Barker on 22/01/2020.
//  Copyright © 2020 Packt. All rights reserved.
//

import UIKit

class WatchHelper: Any {

    // Add Recipe
    static func addRecipe(recipeString: String) -> [RecipeModel] {
        
        var recipes = getRecipes()
        
        let recipe = RecipeModel.createFrom(json: recipeString)
        recipes.append(recipe)
        
        do {
            let data = try JSONEncoder().encode(recipes)
            UserDefaults.standard.set(data, forKey: "recipes")
        } catch {
            print("Unable to persist recipe")
        }
        
        return getRecipes()
        
    }
    
    static func getRecipes() -> [RecipeModel] {
                
        if let data = UserDefaults.standard.data(forKey: "recipes") {
            let array = try! JSONDecoder().decode([RecipeModel].self, from: data)
            return array
        }
        return [RecipeModel]()
        
    }
    
}

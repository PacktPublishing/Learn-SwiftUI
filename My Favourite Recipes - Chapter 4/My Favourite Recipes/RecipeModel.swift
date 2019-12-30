//
//  RecipeModel.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 20/11/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import UIKit

class RecipeModel: Identifiable, ObservableObject {
    @Published var recipes = [String]()
    var id = UUID()
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.recipes.append(contentsOf: ["Pork & Potato Hotpot",
                                              "Thai Green Curry",
                                              "Italian Sausage & Beans"])
        }
    }
}

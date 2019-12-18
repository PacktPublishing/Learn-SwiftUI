//
//  RecipeModel.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 20/11/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import UIKit

struct RecipeModel: Identifiable, Codable {
    
    var id = UUID()
    var name = ""
    var origin = ""
    var countryCode = ""
    var favourite = false
    
  
}

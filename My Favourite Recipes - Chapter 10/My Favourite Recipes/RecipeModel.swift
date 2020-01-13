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
    var ingredients = [String]()
    var recipe = ""
    var imageData: Data?
    var image: UIImage {
        if let dataImage = UIImage(data: imageData ?? Data()) {
            return dataImage
        } else if let countryImage = UIImage(named: countryCode) {
            return countryImage
        }
        return UIImage()
    }
        
}

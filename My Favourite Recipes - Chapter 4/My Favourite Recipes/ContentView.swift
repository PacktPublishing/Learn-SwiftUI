//
//  ContentView.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 19/11/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
        
    let recipeNames = ["Italian Pizza Chicken",
                       "Greek Pasta Bake",
                       "Hearty Parsnip Soup"]
    
    @ObservedObject var recipeModel = RecipeModel()
    

    var body: some View {
        
        Group {
            VStack {
                List(recipeNames, id: \.self) { name in
                    Text("\(name)")
                }
                List(recipeModel.recipes, id: \.self) { name in
                    Text("\(name)")
                }
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

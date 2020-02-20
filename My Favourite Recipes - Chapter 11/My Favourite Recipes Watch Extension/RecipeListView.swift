//
//  ContentView.swift
//  My Favourite Recipes Watch Extension
//
//  Created by Chris Barker on 15/01/2020.
//  Copyright © 2020 Packt. All rights reserved.
//

import SwiftUI

struct RecipeListView: View {
    
    @State var recipes: [RecipeModel]
    
    var body: some View {
        VStack {
            Text("Recipes")
                .font(.headline)
            List(recipes, id: \.id) { recipe in
                NavigationLink(destination: IngredientsView(ingredients: recipe.ingredients, recipeName: recipe.name)) {
                    Text("\(recipe.name)")
                }
            }
        }
    }
        
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView(recipes: Helper.mockRecipes())
    }
}

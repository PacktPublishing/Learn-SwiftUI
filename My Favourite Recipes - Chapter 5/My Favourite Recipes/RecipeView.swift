//
//  RecipieView.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 10/12/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import SwiftUI

struct RecipeView: View {
    @State var recipe = RecipeModel()
    
    var body: some View {
                
        Group {

            VStack(alignment: .leading) {
                Text("\(recipe.name)")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                    .bold()
                
                Image(recipe.countryCode)
            }
            VStack(alignment: .trailing, spacing: 10) {
                Button(action: {
                    Helper.addRemoveFavourite(recipe: self.recipe)
                    self.recipe.favourite.toggle()
                }) {
                    Image(systemName: Helper.isFavourite(name: recipe.name) ? "star.fill" : "star")
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
        }
    }
}

struct RecipieView_Previews: PreviewProvider {
    static var previews: some View {
        let mockRecipes = Helper.mockRecipes()
        return List(mockRecipes, id: \.id) { recipe in
            RecipeView(recipe: recipe)
        }
    }
}


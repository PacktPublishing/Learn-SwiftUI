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
                Image(uiImage: recipe.image).resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
            }
        }
    }
}

struct RecipieView_Previews: PreviewProvider {
    static var previews: some View {
        let mockRecipes = Helper.mockRecipes()
        return List(mockRecipes) { recipe in
            RecipeView(recipe: recipe)
        }
    }
}


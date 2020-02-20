//
//  RecipeDetailView.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 12/12/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var recipe: RecipeModel!
    @State private var viewIndex = 0
    
    private var isFavourite: Bool {
        return Helper.getFavourites().contains(where: {($0.name == recipe.name)})
    }
    
    @EnvironmentObject var settings: AppSettings

    var body: some View {
        // VStack so we can list our components vertically
        VStack(alignment: .leading, spacing: 15) {
            
            // Image (currently using flag)
            Image(uiImage: recipe.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 200)
            
            HStack {
                // Name of our recipe
                Text("\(recipe.name)")
                    .font(.title)
                    .padding(.leading, 10)
                    .foregroundColor(self.settings.fontColor)
                
                // Favourites Button
                Button(action: {
                    Helper.addRemoveFavourite(recipe: self.recipe)
                    self.settings.fontColor = self.isFavourite ? .orange : .black
                    self.recipe.favourite.toggle()
                }) {
                    Image(systemName: isFavourite ? "star.fill" : "star")
                }
                
            }
            
            // Recipe origin
            Text("Origin: \(recipe.origin)")
                .font(.subheadline)
                .padding(.leading, 10)
            
        
            // Picker to choose between Igredients & Recipe
            Picker(selection: $viewIndex, label: Text("")) {
                Text("Ingredients").tag(0)
                Text("Recipe").tag(1)
            }.pickerStyle(SegmentedPickerStyle())
            
            // Logic to determin which Picker View to show.
            if viewIndex == 0 {
                List(recipe.ingredients, id: \.self) { ingredient in
                    Image(systemName: "hand.point.right")
                    Text(ingredient)
                }
                .listStyle(GroupedListStyle())
            } else if viewIndex == 1 {
                Text(recipe.recipe)
                    .padding(15)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Helper.mockRecipes().first!)
    }
}

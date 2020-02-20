//
//  ContentView.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 19/11/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import SwiftUI

struct ListView: View {
        
    @State private var viewIndex = 0
    @Binding var filter: String
    @Binding var showAddRecipe: Bool
    
    var body: some View {
        
            VStack {
                Picker(selection: $viewIndex, label: Text("")) {
                    Text("All").tag(0)
                    Text("Favourites").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                                
                if viewIndex == 0 {
                    List(Helper.getRecipes(filter: filter), id: \.id) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeView(recipe: recipe)
                        }
                    }
                } else if viewIndex == 1 {
                    
                    List(Helper.getFavourites(), id: \.id) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeView(recipe: recipe)
                        }
                    }
                }
                
            }
        
    }
}

class UserData: ObservableObject {
    @Published var favourites = Helper.getFavourites()
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(filter: .constant(""), showAddRecipe: .constant(false))
    }
}

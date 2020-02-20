//
//  ContentView.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 19/11/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    #if DEBUG
    var recipes = Helper.mockRecipes()
    #else
    var recipes = [RecipeModel]()
    #endif
    
    @State private var viewIndex = 0
    
    var body: some View {
        
        NavigationView {
            VStack {
                Picker(selection: $viewIndex, label: Text("")) {
                    Text("Recipes").tag(0)
                    Text("Favourites").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                
                if viewIndex == 0 {
                    List(recipes, id: \.id) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeView(recipe: recipe)
                                .navigationBarTitle(Text("Recipes"))
                        }
                    }
                } else if viewIndex == 1 {
                    
                    List(Helper.getFavourites(), id: \.id) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeView(recipe: recipe)
                                .navigationBarTitle(Text("Favourites"))
                        }
                    }
                }
                
            }
            //.navigationBarTitle(Text("My Favourite Recipes"))
        }
    }
}

class AppSettings: ObservableObject {
    @Published var fontColor = Color.black
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(recipes: Helper.mockRecipes())
    }
}

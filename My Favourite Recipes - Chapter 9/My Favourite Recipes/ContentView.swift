//
//  ContentView.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 19/11/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
        
    @State private var viewIndex = 0
    @State private var showAddRecipe = false
    @State private var showMap = false
    
    @State private var filter: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                Picker(selection: $viewIndex, label: Text("")) {
                    Text("Recipes").tag(0)
                    Text("Favourites").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                                
                if viewIndex == 0 {
                    List(Helper.getRecipes(filter: filter), id: \.id) { recipe in
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
            .navigationBarItems(leading: HStack {
                Button(action: {
                    self.showMap.toggle()
                }) {
                    Image(systemName: "map")
                        .renderingMode(.original)
                }.sheet(isPresented: $showMap) {
                    RecipeMapView(filter: self.$filter)
                }
                Button(action: {
                    self.filter = ""
                }) {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                        .renderingMode(.original)
                }
                }, trailing:
                Button(action: {
                    self.showAddRecipe.toggle()
                }) {
                    Image(systemName: "plus")
                        .renderingMode(.original)
                }.sheet(isPresented: $showAddRecipe) {
                    AddRecipeView()
                })
            
        }
    }
}

class UserData: ObservableObject {
    @Published var favourites = Helper.getFavourites()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

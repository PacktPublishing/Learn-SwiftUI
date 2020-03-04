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
    @State private var showAddRecipe = false
    @State private var showMap = false
    
    @State private var filter: String = ""
    
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        
        NavigationView {
            VStack {
                Picker(selection: $viewIndex, label: Text("")) {
                    Text("Recipes").tag(0)
                    Text("Favourites").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                                
                if viewIndex == 0 {
                    List(appData.getRecipes(filter: filter), id: \.id) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeView(recipe: recipe)
                        }
                    }
                } else if viewIndex == 1 {
                    
                    List(appData.favourites, id: \.id) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeView(recipe: recipe)
                        }
                    }
                }
                
            }
            .navigationBarTitle(Text(""), displayMode: .inline) // Hack due to bug in Xcode!
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
                    AddRecipeView().environmentObject(self.appData)
                })
            
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
        .padding()
    }
}

class AppData: ObservableObject {
    
    @Published var fontColor = Color.black
    @Published var recipes = [RecipeModel]()
    var favourites: [RecipeModel] {
        return recipes.filter({ $0.favourite == true })
    }
    func getRecipes(filter: String) -> [RecipeModel] {
        if filter != "" {
            return recipes.filter ({ $0.origin == filter })
        } else {
            return recipes
        }
    }
    
    func updateRecipe(recipe: RecipeModel) {
        recipes = recipes.filter( { $0.id != recipe.id } )
        recipes.append(recipe)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static let appData = AppData()
    
    static var previews: some View {
        appData.recipes = Helper.mockRecipes()
        return ListView().environmentObject(appData)
    }
}

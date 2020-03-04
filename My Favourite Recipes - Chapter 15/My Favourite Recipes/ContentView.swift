//
//  ContentView.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 11/01/2020.
//  Copyright © 2020 Packt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAddRecipe = false
    @State private var showMap = false
    
    @State private var filter: String = ""
    
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        
        NavigationView {
            
            ListView(filter: $filter, showAddRecipe: $showAddRecipe)
                .navigationBarTitle(Text(""), displayMode: .inline) // Hack!
                .navigationBarItems(leading: HStack {
                    Button(action: {
                        self.showMap.toggle()
                    }) {
                        Image(systemName: "map")
                            .renderingMode(.original)
                    }.sheet(isPresented: $showMap) {
                        RecipeMapView(filter: self.$filter)
                    }
                    .accessibility(identifier: "accessibility.map.button")
                    Button(action: {
                        self.filter = ""
                    }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .renderingMode(.original)
                    }.accessibility(identifier: "accessibility.filter.button")
                    }, trailing:
                    Button(action: {
                        self.showAddRecipe.toggle()
                    }) {
                        Image(systemName: "plus")
                            .renderingMode(.original)
                    }
                    .accessibility(identifier: "accessibility.add.button")
                    .sheet(isPresented: $showAddRecipe) {
                        AddRecipeView().environmentObject(self.appData)
                        
                })
            
            WelcomeView()
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
        
        
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
        return ContentView().environmentObject(appData)
    }
}

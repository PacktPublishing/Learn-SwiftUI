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
        
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        
            VStack {
                Picker(selection: $viewIndex, label: Text("")) {
                    Text("All").tag(0)
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
        
    }

}

struct ListView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        appData.recipes = Helper.mockRecipes()
        return ListView(filter: .constant(""), showAddRecipe: .constant(false)).environmentObject(appData)
    }
}

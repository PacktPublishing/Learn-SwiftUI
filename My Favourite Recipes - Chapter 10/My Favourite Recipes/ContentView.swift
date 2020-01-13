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
            
            WelcomeView()
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

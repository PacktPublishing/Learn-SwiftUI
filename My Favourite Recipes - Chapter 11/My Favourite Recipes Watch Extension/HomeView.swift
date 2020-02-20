//
//  HomeView.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 22/01/2020.
//  Copyright © 2020 Packt. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var recipes = [RecipeModel]()
    
    var body: some View {
        VStack {
            Text("My Favourite Recipes")
                .font(.callout)
            NavigationLink(destination: RecipeListView(recipes: recipes)) {
                Text("Show Recipes")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(recipes: Helper.getRecipes())
    }
}

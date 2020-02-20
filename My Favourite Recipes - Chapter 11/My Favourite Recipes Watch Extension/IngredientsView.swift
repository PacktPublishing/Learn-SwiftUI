//
//  IngredientsView.swift
//  My Favourite Recipes Watch Extension
//
//  Created by Chris Barker on 18/01/2020.
//  Copyright © 2020 Packt. All rights reserved.
//

import SwiftUI

struct IngredientsView: View {
    
    var ingredients = [String]()
    var recipeName = ""
    
    var body: some View {
        VStack {
            Text("Ingredients")
                .font(.headline)
            List(ingredients, id: \.self) { ingredient in
                Text(ingredient)
            }
        }
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView(ingredients: Helper.getMockIngredients(), recipeName: "Ingredients")
    }
}

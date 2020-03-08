//
//  AddRecipeView.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 20/12/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import SwiftUI


struct AddRecipeView: View {
    
    
    @State internal var recipeName: String = ""
    @State internal var ingredient: String = ""
    
    @State internal var ingredients = [String]()
    
    @State internal var recipeDetails: String = ""
    
    @State internal var showingImagePicker = false
    @State private var libraryImage: UIImage?
    
    @State private var selectedCountry = 0
    
    var placeHolderImageName: String {
        return UIDevice.current.userInterfaceIdiom == .pad ? "placeholder-add-image_iPad" : "placeholder-add-image"
    }
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appData: AppData
    
    internal var countries = Helper.getCountries()
    private var numberOfCountires: Int {
        return countries.count
    }
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Button(action: {
                    self.showingImagePicker.toggle()
                }) {
                    Image(uiImage: self.libraryImage ?? (UIImage(named: "placeholder-add-image") ?? UIImage()))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.purple, lineWidth: 3).shadow(radius: 10))
                        .frame(maxWidth: .infinity, maxHeight: 230)
                        .padding(6)
                }
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: self.$libraryImage)
                }.buttonStyle(PlainButtonStyle())
                Section(header: Text("Add Recipe Name:")) {
                    TextField("enter recipe name", text: $recipeName)
                }
                Section(header: Text("Add Ingredient:")) {
                    TextField("enter ingredient name", text: $ingredient)
                        .modifier(AddButton(text: $ingredient, ingredients: $ingredients))
                }
                if ingredients.count > 0 {
                    Section(header: Text("Current Ingredients:")) {
                        List(ingredients, id: \.self) { item in
                            Button(action: {
                                self.ingredients.removeAll { $0 == item }
                            }) {
                                Image(systemName: "minus")
                                    .foregroundColor(Color(UIColor.opaqueSeparator))
                            }
                            .padding(.trailing, 8)
                            Text(item)
                        }
                        
                    }
                }
                Section(header: Text("Details")) {
                    TextView(text: $recipeDetails)
                        .frame(height: 220)
                }
                Section(header: Text("Country of Origin:")) {
                    Picker(selection: $selectedCountry, label: Text("Country")) {
                        ForEach(0 ..< countries.count) {
                            Text(self.countries[$0]).tag($0)
                                .font(.headline)
                        }
                    }
                }
            } // Closing Form Brace
                .navigationBarTitle("Add Recipe")
                .navigationBarItems(leading:
                    Button(action: {
                        self.getRandomImage()
                    }) {
                        Text("Random Image")
                    }, trailing:
                    Button(action: {
                        self.saveRecipe()
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Save")
                    }
            )
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
    
    private func getRandomImage() {
        
        guard let url = URL(string: "https://source.unsplash.com/300x200/?food") else {
            return
        }
        
        NetworkHelper.loadData(url: url) { (image) in
            self.libraryImage = image
        }
        
    }
    
    private func saveRecipe() {
        
        var recipeImage = UIImage()
        if let libImage = libraryImage {
            recipeImage = libImage
        }
        
        let country = countries[selectedCountry]
        
        let newRecipe = RecipeModel(id: UUID(),
                                    name: recipeName,
                                    origin: country,
                                    countryCode: Helper.getCountryCode(country: country),
                                    favourite: false,
                                    ingredients: ingredients,
                                    recipe: recipeDetails,
                                    imageData: recipeImage.jpegData(compressionQuality: 0.3) ?? Data())
        
        // Update Local Saved Data
        self.appData.recipes.append(newRecipe)
        Helper.saveRecipes(recipes: self.appData.recipes)
        
    }
    
}

struct AddButton: ViewModifier {
    
    @Binding var text: String
    @Binding var ingredients: [String]
    
    public func body(content: Content) -> some View {
        
        ZStack(alignment: .trailing) {
            content
            Button(action: {
                if self.text != "" {
                    self.ingredients.append(self.text)
                    self.text = ""
                }
            }) {
                Image(systemName: "plus")
                    .foregroundColor(Color(UIColor.opaqueSeparator))
            }
            .padding(.trailing, 8)
            
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let recipe = Helper.mockRecipes().first!
        return AddRecipeView(recipeName: recipe.name, ingredient: recipe.ingredients.first ?? "", ingredients: recipe.ingredients, recipeDetails: recipe.recipe)
    }
}

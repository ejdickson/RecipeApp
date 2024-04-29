//
//  AddNewRecipeView.swift
//  RecipeApp
//
//  Created by Emma Brennan on 4/28/24.
//

import SwiftUI

struct AddNewRecipeView: View {
    @State var name: String = ""
    @State var selectedCategory: Category = Category.main
    @State var description: String = ""
    @State var ingredients: [String]
    @State var directions: [String]
    @State var image: String = ""
    
    @State private var ingredientToAdd: String = ""
    @State private var directionToAdd: String = ""
    
    @StateObject var recipeApp = RecipeViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $name)
                }
                
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("Description")) {
                    TextField("Description", text: $description)
                }
                
                Section(header: Text("Ingredients")) {
                    VStack {
                        ForEach(ingredients, id: \.self) { ingredient in
                            Text(ingredient)
                        }
                        HStack {
                            TextField("Add another ingredient", text: $ingredientToAdd)
                            Button(action: {
                                ingredients.append(ingredientToAdd)
                                ingredientToAdd = ""
                            }) {
                                Text("Add")
                            }
                            .disabled(ingredientToAdd.isEmpty)

                        }
                    }
                }
                
                Section(header: Text("Directions")) {
                    VStack {
                        ForEach(directions, id: \.self) { direction in
                            Text(direction)
                        }
                        HStack {
                            TextField("Add another step", text: $directionToAdd)
                            Button(action: {
                                directions.append(directionToAdd)
                                directionToAdd = ""
                            }) {
                                Text("Add")
                            }
                            .disabled(directionToAdd.isEmpty)
                        }
                    }
                }
                
                Section(header: Text("Image")) {
                    TextField("Image URL", text: $image)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        var newRecipe = RecipeModel(name: name, image: image, description: description, ingredients: ingredients, directions: directions, category: selectedCategory.rawValue)
                        recipeApp.saveData(newRecipe: newRecipe)
                        name = ""
                        selectedCategory = Category.main
                        description = ""
                        ingredients = [""]
                        directions = [""]
                        image = ""
                    } label: {
                        Label("Done", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .disabled(name.isEmpty)
                }
            })
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct AddNewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecipeView(name: "", description: "", ingredients: [], directions: [])
    }
}

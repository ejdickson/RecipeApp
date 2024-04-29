//
//  NewRecipeView.swift
//  RecipeApp
//
//  Created by Emma Brennan on 4/27/24.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showAddNewRecipe = false
    
    var body: some View {
        NavigationView {
            Button("Add new recipe manually") {
                showAddNewRecipe = true
            }
            .navigationTitle("New Recipe")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddNewRecipe) {
            AddNewRecipeView(name: "", description: "", ingredients: [], directions: [])
        }
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}

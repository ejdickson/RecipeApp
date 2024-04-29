//
//  MenuBar.swift
//  RecipeApp
//
//  Created by Emma Brennan on 4/27/24.
//

import SwiftUI

struct MenuBar: View {
    @StateObject var recipeApp = RecipeViewModel()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            CategoriesView(recipes: recipeApp.recipes)
                .tabItem {
                    Label("Categories", systemImage: "square.fill.text.grid.1x2")
                }
            AddNewRecipeView(name: "", description: "", ingredients: [], directions: [])
                .tabItem {
                    Label("New Recipe", systemImage: "plus")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            GroceryListView()
                .tabItem {
                    Label("Grocery List", systemImage: "cart")
                }
        }
    }
}

#Preview {
    MenuBar()
}

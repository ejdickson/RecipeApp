//
//  MenuBar.swift
//  RecipeApp
//
//  Created by Emma Brennan on 4/27/24.
//

import SwiftUI

struct MenuBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "square.fill.text.grid.1x2")
                }
            NewRecipeView()
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

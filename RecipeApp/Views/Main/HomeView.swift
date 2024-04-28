//
//  HomeView.swift
//  RecipeApp
//
//  Created by Emma Brennan on 4/27/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var recipeApp = RecipeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                RecipeCardGrid(recipes: recipeApp.recipes)
            }
            
            .navigationTitle("My Recipes")
            .onAppear {
                recipeApp.fetchData()
            }
        }

    }
}

#Preview {
    HomeView()
}

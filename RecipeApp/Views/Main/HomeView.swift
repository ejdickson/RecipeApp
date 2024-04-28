//
//  HomeView.swift
//  RecipeApp
//
//  Created by Emma Brennan on 4/27/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var recipeApp = RecipeViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(recipeApp.recipes) { recipe in
                    NavigationLink {
                        RecipeDetailView()
                    } label: {
                        Text(recipe.name)
                    }
                }
            }
            .onAppear {
                recipeApp.fetchData()
            }
        }
    }
}

#Preview {
    HomeView()
}

//
//  RecipeCardGrid.swift
//  RecipeApp
//
//  Created by Emma Brennan on 4/28/24.
//

import SwiftUI

struct RecipeCardGrid: View {
    var recipes: [RecipeModel]
    
    var body: some View {
        VStack {
            HStack {
                Text("\(recipes.count) \(recipes.count == 1 ? "recipe" : "recipes")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        RecipeCard(recipe: recipe)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct RecipeCardGrid_Preview: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecipeCardGrid(recipes: [])
        }
    }
}

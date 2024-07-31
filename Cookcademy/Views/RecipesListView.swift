//
//  ContentView.swift
//  Cookcademy
//
//  Created by Amani White on 26/07/2024.
//

import SwiftUI

struct RecipesListView: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    let category: MainInformation.Category
    
    private let listBackgroundColour = AppColour.background
    private let listTextColour = AppColour.foreground
    
    var body: some View {
        List{
            ForEach(recipes) { recipe in
                NavigationLink(recipe.mainInformation.name,
                               destination: RecipeDetailView(recipe: recipe))
            }
            .listRowBackground(listBackgroundColour)
            .foregroundColor(listTextColour)
        }
        .navigationTitle(navigationTitle)
    }
}
extension RecipesListView {
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
      }
    
    var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
}

#Preview {
    NavigationView {
        RecipesListView(category: .breakfast)
            .environmentObject(RecipeData())
    }
}

//
//  ContentView.swift
//  Cookcademy
//
//  Created by Amani White on 26/07/2024.
//

import SwiftUI

struct RecipesListView: View {
    
    @StateObject var recipeData = RecipeData()
    
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
    var recipes: [Recipe] {
        recipeData.recipes
    }
    
    var navigationTitle: String {
        "All Recipes"
    }
}

#Preview {
    NavigationView {
        RecipesListView()
    }
}

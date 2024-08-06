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
    
    @State private var isPresenting: Bool = false
    @State private var newRecipe = Recipe()
    
    private let listBackgroundColour = AppColour.background
    private let listTextColour = AppColour.foreground
    
    var body: some View {
        NavigationView {
            List{
                ForEach(recipes) { recipe in
                    NavigationLink(recipe.mainInformation.name,
                                   destination: RecipeDetailView(recipe: recipe))
                }
                .listRowBackground(listBackgroundColour)
                .foregroundColor(listTextColour)
            }
            .navigationTitle(navigationTitle)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresenting = true
                    },
                           label: {
                        Image(systemName: "plus")
                    })
                }
            })
            .sheet(isPresented: $isPresenting, content: {
                NavigationView {
                    ModifyRecipeView(recipe: $newRecipe)
                        .toolbar(content: {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    isPresenting = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                if newRecipe.isValid {
                                    Button("Add") {
                                        recipeData.add(recipe: newRecipe)
                                        isPresenting = false
                                    }
                                 }
                            }
                        })
                        .navigationTitle("Add a New Recipe")
                }
            })
        }
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

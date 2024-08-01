//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Amani White on 28/07/2024.
//

import SwiftUI

struct RecipeDetailView: View {
    
    let recipe: Recipe
    private let listBackgroundColour = AppColour.background
    private let listTextColour = AppColour.foreground
    
    var body: some View {
        VStack {
            HStack {
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack {
                Text("\(recipe.mainInformation.description)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            List {
                Section(header: Text("Ingredients")) {
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                           .foregroundColor(listTextColour)
                    }
                }
                .listRowBackground(listBackgroundColour)
                Section(header: Text("Direction")) {
                    ForEach(recipe.directions.indices, id: \.self) { index in
                        let direction = recipe.directions[index]
                        HStack {
                            Text("\(index + 1): ").bold()
                            Text("\(direction.isOptional ? "(Optional) " : "")" + "\(direction.description)")
                        }
                        .foregroundColor(listTextColour)
                    }
                }
                .listRowBackground(listBackgroundColour)
            }
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
  @State static var recipe = Recipe.testRecipes[0]
  static var previews: some View {
    NavigationView {
      RecipeDetailView(recipe: recipe)
    }
  }
}

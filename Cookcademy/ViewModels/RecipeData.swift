//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Amani White on 27/07/2024.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}

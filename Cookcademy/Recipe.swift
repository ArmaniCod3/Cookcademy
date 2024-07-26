//
//  Recipe.swift
//  Cookcademy
//
//  Created by Amani White on 26/07/2024.
//

import Foundation

struct Recipe {
    var mainInformation: MainInformation
    var ingredients: [String]
    var directions: [String]
}

struct MainInformation {
    var name: String
    var description: String
    var author: String
    var category: String // Breakfast, Lunch, Dinner, Dessert
}

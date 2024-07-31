//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Amani White on 31/07/2024.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    
    @StateObject private var recipeData = RecipeData()
    
    var body: some View {
        NavigationView {
            ScrollView {
                let columns = [GridItem(), GridItem()]
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        NavigationLink(
                          destination: RecipesListView(category: category)
                            .environmentObject(recipeData),
                          label: {
                            CategoryView(category: category)
                          })
                    }
                })
                .navigationTitle(navigationTitle)
            }
        }
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
            Text(category.rawValue)
                .font(.title)
        }
    }
}

extension RecipeCategoryGridView {
    var navigationTitle: String {
        "Categories"
    }
}

#Preview {
    RecipeCategoryGridView()
}

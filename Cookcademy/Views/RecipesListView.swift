//
//  ContentView.swift
//  Cookcademy
//
//  Created by Rory Farwell on 28/05/2023.
//

import SwiftUI

struct RecipesListView: View {
    //StateObject so that the view updates when the model changes
    @StateObject var recipeData = RecipeData()
    let category: MainInformation.Category
    
    private let listBackgroundColor = AppColor.background
    private let listForegroundColor = AppColor.foreground
    
    var body: some View {
        NavigationView{
            List {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: {
                        RecipeDetailView(recipe: recipe)
                    }, label: {Text(recipe.mainInformation.name)})
                }
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listForegroundColor)
            }
            .navigationTitle(navigationTitle)
            .listStyle(.inset)
            
        }
    }
}

extension RecipesListView {    
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
    }
    
    var navigationTitle: String {
        category.rawValue
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView(category: MainInformation.Category.breakfast)
            .environmentObject(RecipeData())
    }
}

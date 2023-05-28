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
    var recipes: [Recipe] {
        recipeData.recipes
    }
    
    var navigationTitle: String {
        "All Recipes"
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
    }
}

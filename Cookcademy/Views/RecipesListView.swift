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
    
    var body: some View {
        NavigationView{
            List {
                ForEach(recipes) { recipe in
                    Text(recipe.mainInformation.name)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle(navigationTitle)
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

//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Rory Farwell on 28/05/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    private let listBackgroundColor = AppColor.background
    private let listForegroundColor = AppColor.foreground
    
    var body: some View {
        VStack {
            HStack {
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack {
                Text(recipe.mainInformation.description)
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            List {
                Section(header: Text("Ingredients"), content: {
                    ForEach(recipe.ingredients.indices, id: \.self) {index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                            .foregroundColor(listForegroundColor)
                    }
                    .listRowBackground(listBackgroundColor)
                })
                Section(header: Text("Directions"), content: {
                    ForEach(recipe.directions.indices, id: \.self) {index in
                        let direction = recipe.directions[index]
                        HStack(alignment: .top){
                            Text("\(index + 1).")
                                .bold()
                            Text("\(direction.isOptional ? "(Optional)" : "") \(direction.description)")
                        }
                        .foregroundColor(listForegroundColor)
                    }
                    .listRowBackground(listBackgroundColor)
                })
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

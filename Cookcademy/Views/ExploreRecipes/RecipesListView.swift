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
    
    @State var isPresenting = false
    @State var newRecipe = Recipe() //Empty recipe to be populated by the modify recipe sheet
    
    private let listBackgroundColor = AppColor.background
    private let listForegroundColor = AppColor.foreground
    
    var body: some View {
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
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresenting = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            })
            .sheet(isPresented: $isPresenting, content: {
                NavigationView(content: {
                    ModifyRecipeView(recipe: $newRecipe)
                        .toolbar(content: {
                            ToolbarItem(placement: .cancellationAction){
                                Button("Dismiss") {
                                    isPresenting = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction){
                                if newRecipe.isValid {
                                    Button("Add") {
                                        recipeData.addRecipe(recipe: newRecipe)
                                        isPresenting = false
                                    }
                                }
                            }
                        })
                        .navigationTitle("Add a new recipe")
                })
            })
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
        NavigationView(content: {
            RecipesListView(category: MainInformation.Category.breakfast)
                .environmentObject(RecipeData())
        })
        
    }
}

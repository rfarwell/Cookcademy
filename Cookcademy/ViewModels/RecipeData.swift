//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Rory Farwell on 28/05/2023.
//

import Foundation

/**
 RecipeData conforms to the ObservableObject protocol. The ObservableObject protocol monitors when the @Published property changes. The @Published property wrapper attaches to a property to monitor any changes. Here, recipes will monitor when Recipe.testRecipes changes. RecipeData needs to be a class to conform to the ObservableObject protocol.
 */
class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}

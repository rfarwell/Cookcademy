//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Rory Farwell on 06/07/2023.
//

import SwiftUI

struct ModifyIngredientsView: View {
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @Binding var ingredients: [Ingredient]
    @State private var newIngredient = Ingredient(name: "",
                                                  quantity: 0.0,
                                                  unit: .none)
    
    
    
    var body: some View {
        VStack {
            let addIngredientView = ModifyIngredientView(ingredient: $newIngredient) { ingredient in
                    ingredients.append(ingredient)
                    newIngredient = Ingredient()
                  }
            if ingredients.isEmpty {
                Spacer()
                NavigationLink("Add the first ingredient", destination: addIngredientView)
                Spacer()
            } else {
                List {
                    ForEach(ingredients.indices, id: \.self) { index in
                        let ingredient = ingredients[index]
                        Text(ingredient.description)
                    }
                    .listRowBackground(listBackgroundColor)
                    NavigationLink("Add another ingredient",
                                   destination: addIngredientView
                    )
                    .listRowBackground(listBackgroundColor)
                    .buttonStyle(PlainButtonStyle())
                }
                .foregroundColor(listTextColor)
            }
            
        }
        
        
        
    }
}

struct ModifyIngredientsView_Previews: PreviewProvider {
    @State static var emptyIngredients = [Ingredient]()
    @State static var nonEmptyIngredients = [Ingredient()]
    
    static var previews: some View {
        
        NavigationView{
            ModifyIngredientsView(ingredients: $emptyIngredients)
        }
        NavigationView{
            ModifyIngredientsView(ingredients: $nonEmptyIngredients)
        }
        
        
    }
}

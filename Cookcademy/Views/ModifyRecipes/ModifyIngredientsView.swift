//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Rory Farwell on 06/07/2023.
//

import SwiftUI

struct ModifyIngredientsView: View {
    
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
                    NavigationLink("Add another ingredient",
                                   destination: addIngredientView
                    )
                    .buttonStyle(PlainButtonStyle())
                }
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

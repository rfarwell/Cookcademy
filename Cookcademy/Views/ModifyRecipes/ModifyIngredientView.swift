//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Rory Farwell on 24/06/2023.
//

import SwiftUI

struct ModifyIngredientView: View {
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @Binding var ingredient: Ingredient
    let createAction: ((Ingredient) -> Void)
    
    var body: some View {
        VStack {
            Form {
                //Text field to change ingredient name
                TextField("Ingredient Name", text: $ingredient.name)
                
                //Stepper for changing the quantity of the ingredient
                Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
                    HStack {
                        Text("Quantity")
                        TextField("Quantity",
                                  value: $ingredient.quantity,
                                  formatter: NumberFormatter.decimal)
                        .keyboardType(.numbersAndPunctuation)
                    }
                }
                
                //Picker to choose which unit is used
                Picker(selection: $ingredient.unit,
                       label: HStack {
                    Text("Unit")
                }) {
                    ForEach(Ingredient.Unit.allCases, id: \.self) {unit in
                        Text(unit.rawValue)
                    }
                }
                .pickerStyle(.menu)
                
                HStack {
                    Spacer()
                    Button("Save") {
                        createAction(ingredient)
                    }
                    Spacer()
                }
                
            }
        }
    }
}

extension NumberFormatter {
  static var decimal: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter
  }
}

struct ModifyIngredientView_Preview: PreviewProvider {
  @State static var emptyIngredient = Ingredient()
  static var previews: some View {
    NavigationView {
      ModifyIngredientView(ingredient: $emptyIngredient) { ingredient in
        print(ingredient)
      }
    }
  }
}

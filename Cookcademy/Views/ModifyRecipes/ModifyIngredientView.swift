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
    
    @Binding var mainInformation: MainInformation
    
    var body: some View {
        VStack {
            Text("Hello world")
//            ForEach (mainInformation)
//            NavigationView(content: {
//                NavigationLink(destination: {ModifyMainInformationView(mainInformation: $mainInformation)}, label: {
//                    Text("Add another ingredient")
//                })
//            })
        }
    }
}

struct ModifyIngredientsView_Previews: PreviewProvider {
    @State static var mainInformation = MainInformation(name: "Test Name",
                                                        description: "Test Description",
                                                        author: "Test Author",
                                                        category: .breakfast)
    @State static var emptyInformation = MainInformation(name: "", description: "", author: "", category: .breakfast)
    
    static var previews: some View {
        ModifyIngredientView(mainInformation: $mainInformation)
        ModifyIngredientView(mainInformation: $emptyInformation)
    }
}

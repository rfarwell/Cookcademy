//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Rory Farwell on 29/05/2023.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    private var recipeData = RecipeData()
    
    var body: some View {
        NavigationView(content: {
            ScrollView{
                LazyVGrid(columns: [GridItem(), GridItem()], content: {
                    ForEach(MainInformation.Category.allCases,
                            id: \.self) {category in
                        CategoryView(category: category)
                    }
                }).navigationTitle("Categories")
            }
            
        }
        )
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
                .cornerRadius(5)
            Text(category.rawValue)
                .font(.largeTitle)
                .bold()
        }
    }
    
    
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}

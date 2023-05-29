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
        let columns = [GridItem(), GridItem()]
        NavigationView(content: {
            ScrollView{
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases,
                            id: \.self) {category in
                        NavigationLink(destination: {RecipesListView(category: category)},
                                       label: {
                            CategoryView(category: category).foregroundColor(.black)
                        })
                        
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

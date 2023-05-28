//
//  ContentView.swift
//  Cookcademy
//
//  Created by Rory Farwell on 28/05/2023.
//

import SwiftUI

struct RecipesListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
    }
}

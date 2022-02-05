//
//  ContentView.swift
//  Kainsh
//
//  Created by Viennarz Curtiz on 2/5/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = RecipeDataModel()
    
    var body: some View {
        NavigationView {
            List(model.recipes) { recipe in
                NavigationLink(destination: ItemDetail(item: recipe)) {
                    ItemRow(recipe: recipe)
                }

            }
            .navigationTitle("Recipes")
            .listStyle(.grouped)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
        
            .previewInterfaceOrientation(.landscapeRight)
        
        ContentView()
            .previewDevice("iPhone 13 mini")
            .previewInterfaceOrientation(.portrait)
    }
}

struct ItemRow: View {
    var recipe: Recipe
    var body: some View {
        
        HStack(alignment: .center, spacing: 16) {
            
            if let urlString = recipe.imageURL, let url = URL(string: urlString) {
                AsyncImage(url: url, scale: 0.5) { img in
                    
                    img.resizable()
                        .cornerRadius(30)
                        .frame(width: 30, height: 30)
                    
                } placeholder: {
                    Circle()
                        .frame(width: 30, height: 30)
                }
                
                
            } else {
                Image(systemName: "fork.knife.circle")
            }
            
            Text(recipe.name)
                .font(.subheadline)
                .fontWeight(.light)
        }
    }
}

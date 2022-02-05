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
                HStack(alignment: .center, spacing: 16) {
                    
                    
                    if let urlString = recipe.imageURL, let url = URL(string: urlString) {
                        AsyncImage(url: url, scale: 0.5) { img in
                            
                            img.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 30, maxHeight: 30)
                                .cornerRadius(30)
                            
                        } placeholder: {
                            Circle()
                                .frame(maxWidth: 30, maxHeight: 30)
                        }
                        
                
                    } else {
                        Image(systemName: "fork.knife.circle")
                    }
              
                    
                    
                    Text(recipe.name)
                        .font(.title2)
                }

            }
            .navigationTitle("Recipes")
            .listStyle(.sidebar)
            
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

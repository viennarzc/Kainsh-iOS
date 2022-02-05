//
//  ItemDetail.swift
//  Kainsh
//
//  Created by Viennarz Curtiz on 2/5/22.
//

import SwiftUI

struct ItemDetail: View {
    let item: Recipe
    
    @State private var stepsViewIsPresented = false
    
    var body: some View {
        VStack(alignment: .center) {
            
            if let urlString = item.imageURL,
                let url = URL(string: urlString) {
                
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 150, alignment: .center)
                        .cornerRadius(16)
                    
                } placeholder: {
                    Color.gray
                        .frame(height: 200, alignment: .center)
                }
                .cornerRadius(16)
                .padding([.bottom, .leading, .trailing], 16)
                .animation(.easeIn, value: 0)
  
                
            } else {
               EmptyView()
            }
            
            HStack {
                Button {
                    stepsViewIsPresented = true
                } label: {
                    Text("Start Cooking")
                        .frame(width: 100, alignment: .center)
                        .font(Font.subheadline.bold())
                        .foregroundColor(.black)
                        .padding(8)
                        .background(Color.orange)
                        .cornerRadius(16)
                    
                }.sheet(isPresented: $stepsViewIsPresented) {
                    
                } content: {
                    
                }
                .padding(.leading, 16)
                
                Spacer()
                
            }
   
            List() {
                Section("Ingredients") {
                    
                    ForEach(item.ingredients, id: \.self) { ing in
                        HStack {
                            Text(ing.name)
                            Spacer()
                            Text(ing.quantity)
                        }
                        
                    }
                }
            }

        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: Recipe.example)
    }
}


struct ItemDetailViewModel {
    
}

//
//  CookingStepsView.swift
//  Kainsh
//
//  Created by Viennarz Curtiz on 2/5/22.
//

import SwiftUI

struct CookingStepsView: View {
    var viewModel: CookingStepsViewModel
    
    var body: some View {
        NavigationView {
            TabView {
                ForEach(viewModel.stepsVM) { step in
                    VStack {
                        
                        Text(step.title)
                            .font(.title)
                            .foregroundColor(Color(uiColor: .label))
                        Spacer()

                        if step.timer != 0 {
                            TimerButtonContainer(buttonTitle: "Start Timer", timer: step.timer, tapped: {
                                print("hehe")
                            })
                        } else {
                            /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                        }
                        
                        Spacer()

                    }
                    .padding()
                }
                
            }
            .frame(width: UIScreen.main.bounds.width,height: 600)
            .tabViewStyle(PageTabViewStyle()) //make a paged effect when swiping
            .navigationTitle("Steps")
        }
        .foregroundColor(.black)
        
    }
}

struct CookingStepsView_Previews: PreviewProvider {
    static var previews: some View {
        CookingStepsView(viewModel: CookingStepsViewModel(steps: Recipe.example.steps, timers: Recipe.example.timers))
    }
}


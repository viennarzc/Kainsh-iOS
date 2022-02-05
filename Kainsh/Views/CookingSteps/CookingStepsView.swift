//
//  CookingStepsView.swift
//  Kainsh
//
//  Created by Viennarz Curtiz on 2/5/22.
//

import SwiftUI

struct CookingStepsView: View {
    var viewModel: CookingStepsViewModel
    
    @State private var countdownRuning: Bool = false
    
    var body: some View {
        NavigationView {
            TabView {
                ForEach(viewModel.stepsVM) { step in
                    VStack(alignment: .center, spacing: 16) {
                        
                        Text(step.title)
                            .font(.title)
                            .foregroundColor(Color(uiColor: .label))
                        
                        Spacer()

                        if step.timer != 0 {
                            CountdownView(counter: 0, isRunningTime: $countdownRuning, countTo: step.timer * 60)
                                .frame(width: 150, height: 150, alignment: .center)
                            //original value is in minutes so we multiply to  60 to become seconds
                        } else {
                            /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                        }

                        
                        if !countdownRuning, step.timer != 0 {
                            
                            Button {
                                countdownRuning = true
                            } label: {
                                Text(countdownRuning ? "Pause" : "Start")
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 8).fill(countdownRuning ? Color.red : Color.green))
                                
                            }
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


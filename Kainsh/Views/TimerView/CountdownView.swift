//
//  CountdownView.swift
//  Kainsh
//
//  Created by Viennarz Curtiz on 2/5/22.
//

import SwiftUI

struct CountdownView: View {
    @State var counter: Int = 0
    
    @Binding var isRunningTime: Bool
    
    let timer = Timer
         .publish(every: 1, on: .main, in: .common)
         .autoconnect()

    var countTo: Int = 120
    
    var body: some View {
        VStack{
            ZStack{
                ProgressTrack()
                ProgressBar(counter: counter, countTo: countTo)
                ClockView(counter: counter, countTo: countTo)
            }
        }.onReceive(timer) { time in
            if isRunningTime {
                timer.upstream.autoconnect()
            }
            
            
            if (self.counter < self.countTo) {
                
                self.counter += 1
            }
        }.onAppear {
            timer.upstream.connect().cancel()
        }
        
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(isRunningTime: .constant(false))
        }
    }

    struct ProgressTrack: View {
        
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 150, height: 150)
            .overlay(
                Circle().stroke(Color.gray, lineWidth: 15)
            )
    }
}

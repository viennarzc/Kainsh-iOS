//
//  ClockView.swift
//  Kainsh
//
//  Created by Viennarz Curtiz on 2/5/22.
//

import SwiftUI

struct ClockView: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
            VStack {
    Text(counterToMinutes())
                    .fontWeight(.black)
            }
        }
    
    func counterToMinutes() -> String {
    let currentTime = countTo - counter
    let seconds = currentTime % 60
    let minutes = Int(currentTime / 60)
    return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
        }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(counter: 300, countTo: 0)
    }
}

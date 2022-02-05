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
    
    var numberTextFont: Font = .title
    
    var body: some View {
            VStack {
                Text(counterToMinutes())
                    .font(numberTextFont)
                    .foregroundColor(Color(uiColor: .label))
                    .fontWeight(.semibold)
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
        ClockView(counter: 0, countTo: 45000)
    }
}

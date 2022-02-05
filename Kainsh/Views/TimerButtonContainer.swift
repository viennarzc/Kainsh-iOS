//
//  TimerButtonContainer.swift
//  Kainsh
//
//  Created by Viennarz Curtiz on 2/5/22.
//

import SwiftUI

struct TimerButtonContainer: View {
    var buttonTitle: String
    var timer: Int
    var tapped: () -> Void
    
    var body: some View {
        Button {
            tapped()
            
        } label: {
            VStack {
                Text(buttonTitle)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(uiColor: .label))
                
                
                Text("\(timer)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(uiColor: .label))
                
            }
            .padding()
            .overlay {
                Circle()
                    .stroke(Color.orange, lineWidth: 2)
            }
            .frame(width: 150, height: 150, alignment: .center)
            .background(Circle())
        }
    }
}


struct TimerButtonContainer_Previews: PreviewProvider {
    static var previews: some View {
        TimerButtonContainer(buttonTitle: "Start Timer", timer: 200, tapped: {})
            .previewLayout(.sizeThatFits)
    }
}

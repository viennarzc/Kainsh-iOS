//
//  ProgressBar.swift
//  Kainsh
//
//  Created by Viennarz Curtiz on 2/5/22.
//

import SwiftUI

struct ProgressBar: View {
    var counter: Int
    var countTo: Int
    var body: some View {
            Circle()
                .fill(Color.clear)
                .frame(width: 250, height: 250)
                .overlay(
                    Circle().trim(from:0, to: progress())
                        .stroke(
                            style: StrokeStyle(
                            lineWidth: 15,
                            lineCap: .round,
                            lineJoin:.round)
                    ).foregroundColor(
                            (completed() ? Color.green : Color.orange)
                    ).animation(.easeIn, value: 5)
            )
    }

    func completed() -> Bool {
        return progress() == 1
    }


    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}


struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(counter: 2, countTo: 2)
    }
}

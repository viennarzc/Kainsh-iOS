//
//  CookingStepsViewModel.swift
//  Kainsh
//
//  Created by Viennarz Curtiz on 2/5/22.
//

import Foundation

struct CookingStepsViewModel {
    var stepsVM: [StepsCardViewModel] = []
    
    init(steps: [String], timers: [Int]) {
        
        for (step, time) in zip(steps, timers) {
            stepsVM.append(StepsCardViewModel(title: step, timer: time))
        }

    }
}

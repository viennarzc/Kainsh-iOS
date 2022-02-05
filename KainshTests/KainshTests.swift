//
//  KainshTests.swift
//  KainshTests
//
//  Created by Viennarz Curtiz on 2/5/22.
//

import XCTest
@testable import Kainsh

class KainshTests: XCTestCase {

    func testData() {
        let sut = RecipeDataModel()
        
        XCTAssertTrue(sut.recipes.count >= 1 , "Empty")
    }
    
    func testCookingStepsViewModel_WhenInjectingData_ShouldHaveDagta() {
        let sut = CookingStepsViewModel(steps: ["Step 1"], timers: [20])
        
        XCTAssertTrue(!sut.stepsVM.isEmpty, "steps is empty")
    }

}

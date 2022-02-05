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

}

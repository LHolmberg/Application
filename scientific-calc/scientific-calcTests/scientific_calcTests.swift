//
//  scientific_calcTests.swift
//  scientific-calcTests
//
//  Created by Lukas Holmberg on 2020-06-07.
//  Copyright © 2020 Stefan Holmberg. All rights reserved.
//

import XCTest
@testable import scientific_calc

class scientific_calcTests: XCTestCase {
    
    func testDerivative() {
        let data = DataHandeler(action: "derive", equation: "x*x")
        data.FetchData() { (returnValue) in
            XCTAssertEqual("2 x", returnValue.result)
        }
    }
    
    func testIntegration() {
        let data = DataHandeler(action: "integrate", equation: "2x")
        data.FetchData() { (returnValue) in
            XCTAssertEqual("x^2", returnValue.result)
        }
    }
    
    func testCosine() {
        let data = DataHandeler(action: "derive", equation: "pi")
        data.FetchData() { (returnValue) in
            XCTAssertEqual("-1", returnValue.result)
        }
    }
}

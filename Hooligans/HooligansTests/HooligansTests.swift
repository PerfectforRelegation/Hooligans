//
//  HooligansTests.swift
//  HooligansTests
//
//  Created by 정명곤 on 2023/09/18.
//

import XCTest
@testable import Hooligans

var sut: forTestObject!

final class HooligansTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = forTestObject()
    }
    
    func testNumberIsGetOne() throws {
        // given
        let guess = sut.targetNum
        
        // when
        let result = sut.getPlusOne(num: guess)
        
        // then
//        XCTAssertEqual(guess, result, "it's diff")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

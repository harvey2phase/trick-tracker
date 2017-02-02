//  Trick_TrackerTests.swift - Trick TrackerTests

//  Created by Harvey Wang
//  Copyright © 2017 Harvey Wang. All rights reserved.

/*
 
 References:
 
 Title: Start Developing iOS Apps (Swift)
 Author: Apple Inc.
 Date: 2016-12-08
 Type: Source code
 Availability: https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/index.html#//apple_ref/doc/uid/TP40015214-CH2-SW1
 
 */

import XCTest
@testable import Trick_Tracker

class Trick_TrackerTests: XCTestCase {
    
    //MARK: Trick Class Tests
    
    // confirms that a Trick object is returned when valid parameters are passed in
    func testTrickInitializationTrue() {
        
        // 0 stars
        let zeroStarTrick = Trick.init(name: "Zero", picture: nil, starNum: 0)
        XCTAssertNotNil(zeroStarTrick)
        
        // 5 stars
        let positiveStarTrick = Trick.init(name: "Positive", picture: nil, starNum: 5)
        XCTAssertNotNil(positiveStarTrick)
    }
    
    // confirms that nil is returned when a nagative starNum is or an empty name is passed in
    func testTrickInitializationFalse() {
        
        // negative stars
        let negativeStarTrick = Trick.init(name: "Negative", picture: nil, starNum: -1)
        XCTAssertNil(negativeStarTrick)
        
        // empty String
        let emptyStringTrick = Trick.init(name: "", picture: nil, starNum: 0)
        XCTAssertNil(emptyStringTrick)
        
        // starNum > max
        let largeStarTrick = Trick.init(name: "Large", picture: nil, starNum: 6)
        XCTAssertNil(largeStarTrick)
    }
}

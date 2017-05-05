//
//  TrickTrackerTests.swift
//  TrickTrackerTests
//
//  Created by Harvey Wang on 2017-05-01.
//  Copyright © 2017 Harvey Wang. All rights reserved.
//

import XCTest
@testable import TrickTracker

class TrickTrackerTests: XCTestCase {
    
    //MARK: Trick Class Tests
    
    // Confirm that the Trick intializer returns a Trick object when passed valid parameters.
    func testTrickInitializationSucceeds() {
        
        // Zero rating
        let zeroRatingTrick = Trick.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingTrick)
        
        // Highest positive rating
        let positiveRatingTrick = Trick.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingTrick)
    }
    
    // Confirm that the Trick initializer returns nil when passed a negative rating or an empty name.
    func testTrickInitializationFails() {
        
        // Negative rating
        let negativeRatingTrick = Trick.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingTrick)
        
        // Rating exceeds maximum
        let largeRatingTrick = Trick.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingTrick)
        
        // Empty String
        let emptyStringTrick = Trick.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringTrick)
    }
    
}

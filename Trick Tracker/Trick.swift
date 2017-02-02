//  Trick.swift - Trick Tracker

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


import UIKit

class Trick {
    
    //MARK: Properties
    
    var name: String
    var picture: UIImage?
    var starNum: Int
    
    //MARK: Inititalization
    init?(name: String, picture: UIImage?, starNum: Int) {
        
        // name is not empty
        guard !name.isEmpty else {
            return nil
        }
        
        // starNum is between 0 and 5
        guard (starNum >= 0) && (starNum <= 5) else {
            return nil
        }
        
        // initialize stored properties
        self.name = name
        self.picture = picture
        self.starNum = starNum
    }
}

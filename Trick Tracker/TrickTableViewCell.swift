//  TrickTableViewCell.swift - Trick Tracker

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

class TrickTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var starControl: StarControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

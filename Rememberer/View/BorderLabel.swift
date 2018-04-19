//
//  BorderLabel.swift
//  Rememberer
//
//  Created by Tohil on 14/11/2017.
//  Copyright © 2017 Tohil. All rights reserved.
//

import UIKit
import CoreGraphics

class BorderLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 12.0
        layer.backgroundColor = UIColor.init(red: 39, green: 44, blue: 117, alpha: 1.0).cgColor
        
            
        //make it wider
    }

}

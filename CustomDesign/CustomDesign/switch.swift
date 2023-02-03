//
//  switch.swift
//  CustomDesign
//
//  Created by Shraddha on 25/01/23.
//

import Foundation
import UIKit
class Switch: UISwitch{
    override init(frame: CGRect) {
        super.init(frame : frame)
        
    }
    required init?(coder : NSCoder) {
        super.init(coder : coder )
        self.onTintColor = .yellow
        self.tintColor = .red
//        tintColor = .cyan
        self.thumbTintColor = .cyan

        
        
    }
    
}

//
//  CustomSlide.swift
//  CustomDesign
//
//  Created by Shraddha on 25/01/23.
//

import Foundation
import UIKit

class CustomSlider:UISlider{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.value = 0.7
        self.tintColor = .yellow
//        self.backgroundColor = .red
        self.thumbTintColor = .blue
        self.maximumTrackTintColor = .green
        self.setThumbImage(UIImage(named: "Image2"), for: .normal)
//        self.setThumbImage(UIImage(named: "Image1"), for: .focused)

    }
}

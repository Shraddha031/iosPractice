//
//  CustomLable.swift
//  CustomDesign
//
//  Created by Shraddha on 24/01/23.
//

import Foundation
import UIKit

class CustomLable:UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.textColor = .yellow
        self.backgroundColor = .blue
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.masksToBounds = true
        self.textAlignment = .center
        self.font = UIFont(name: "Marker Felt-Wide", size: 49)
//        self.font = UIFont.boldSystemFont(ofSize: 49.0)
//        self.font = UIFont.italicSystemFont(ofSize: 49.0)


    }
}
 

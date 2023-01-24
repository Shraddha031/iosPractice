//
//  CustomButton.swift
//  CustomDesign
//
//  Created by Shraddha on 24/01/23.
//

import Foundation
import UIKit


class CustomButton : UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("abcgggg")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("abcd")
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.backgroundColor = UIColor(red:1.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
        self.tintColor = UIColor(named: "MyColor")
    }
    
//    @IBInspectable var cornerRadius: CGFloat = 0 {
//        didSet {
//            self.layer.cornerRadius = 50
//        }
//
//    }
//    @IBInspectable override var backgroundColor: UIColor?{
//        didSet {
//            self.layer.backgroundColor = UIColor(red:1.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
//        }
//    }
}

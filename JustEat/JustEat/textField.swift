//
//  textField.swift
//  JustEat
//
//  Created by Shraddha on 07/02/23.
//

import UIKit

class TextField: UITextField {
  let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 15)
  override open func textRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
      
  }
  override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
  }
  override open func editingRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
  }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.borderColor = UIColor(named: "justEatGrey")?.cgColor
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 10.0

    }
}

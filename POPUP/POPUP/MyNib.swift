//
//  MyNib.swift
//  POPUP
//
//  Created by Shraddha on 27/01/23.
//

import Foundation
import UIKit

extension UINib {
    class func loadPopup(owner: Any?) -> UIView {
        if let cs = UINib(nibName: "PopupView", bundle: Bundle.main).instantiate(withOwner: owner, options: nil).first as? UIView {
            return cs
        }
        return UIView()
    }
}

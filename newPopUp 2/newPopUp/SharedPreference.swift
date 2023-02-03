//
//  SharedPreference.swift
//  newPopUp
//
//  Created by Shraddha on 31/01/23.
//

import Foundation
import UIKit

final class SharedPreference: NSObject {
    static let shared = SharedPreference()
    
    var birthday: String = "Shraddha"
    
    enum ClickedButton {
        case first
        case second
    }
    
    var callingVC: ClickedButton?
}

//
//  CustomeDesign.swift
//  JustEatNew
//
//  Created by Shraddha on 15/02/23.
//

import Foundation
import SwiftUI
import UIKit

struct GrowingButton: ButtonStyle {
    let width = UIScreen.main.bounds.width
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("BlueShade"))
            .foregroundColor(.white)
//            .scaleEffect(configuration.isPressed ? 1.2 : 1)
//            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            
    }
}


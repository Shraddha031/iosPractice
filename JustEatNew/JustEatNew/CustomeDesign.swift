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
extension View {
  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape( RoundedCorner(radius: radius, corners: corners) )
  }
}
struct RoundedCorner: Shape {
  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    return Path(path.cgPath)
  }
}





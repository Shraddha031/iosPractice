//
//  CustomButton.swift
//  JustEatNew
//
//  Created by Shraddha on 16/02/23.
//

import SwiftUI

struct PrimaryButton: View {
    var btnTitle: String?
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: action ??  {
            print("No Action")
        },label : {
            Spacer()
            Text(btnTitle ?? "Button")
            Spacer()
        }).padding().frame(maxWidth: .infinity)
        .background(Color("BlueShade"))
            .cornerRadius(15)
            .foregroundColor(.white)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton()
    }
}
struct SecondaryButton: View {
    var btnTitle: String?
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: action ??  {
            print("No Action")
        },label : {
            Spacer()
            Text(btnTitle ?? "Button")
            Spacer()
        }).padding().frame(maxWidth: .infinity)
        .background(Color("DarkShade"))
            .cornerRadius(15)
            .foregroundColor(.white)
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton()
    }
}

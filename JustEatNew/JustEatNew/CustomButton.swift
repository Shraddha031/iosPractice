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
                .font(.title3)
                .fontWeight(.semibold)
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
            Text(btnTitle ?? "Button").font(.title3)
                .fontWeight(.semibold).foregroundColor(Color("BlueShade"))
            Spacer()
        }).padding().frame(maxWidth: .infinity)
            .foregroundColor(.white).overlay {
                RoundedRectangle(cornerRadius: 15, style: .continuous).stroke(Color("BlueShade"),lineWidth: 3)
            }.background(Color.clear).cornerRadius(15)
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton()
    }
}

struct ThirdButton: View {
    var btnTitle: String?
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: action ??  {
            print("No Action")
        },label : {
            HStack {
                Spacer()
                Text(btnTitle ?? "Button").font(.system(size: 20))
                Text("→")
                    .fontWeight(.bold)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2)).font(.system(size: 18))
                Spacer()
            }
        }).padding().frame(maxWidth: .infinity)
        .background(Color("GreenShade"))
            .cornerRadius(15)
            .foregroundColor(.white).fontWeight(.semibold)
    }
}

struct ThirdButton_Previews: PreviewProvider {
    static var previews: some View {
        ThirdButton()
    }
}

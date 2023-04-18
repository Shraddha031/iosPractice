//
//  GetStartedView.swift
//  JustEatNew
//
//  Created by Shraddha on 16/02/23.
//

import SwiftUI

struct GetStartedView: View {
    @State private var loginIsActive = false
    @State private var signupIsActive = false
    @Binding var userLoggedIn:Bool 
    var body: some View {
            ZStack{
                Color("DarkShade").ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Image("pizzaBW").resizable().scaledToFill().frame(width:200, height: 200).padding(.trailing, -70).padding(.top, -20).opacity(0.3)
                    }
                    Spacer()
                    HStack(alignment: .center, spacing: 15){
                        Text("Food")
                          .foregroundColor(Color("BlueShade"))
                        Text("For").foregroundColor(Color("BlueShade"))
                        Text("Y").padding(.trailing,-16).foregroundColor(Color(hue: 0.109, saturation: 0.066, brightness: 0.967))
                        Text("ou").foregroundColor(Color("BlueShade"))
                    }  .font(.largeTitle)
                        .fontWeight(.bold).padding(.bottom,2)
                    Text("With Greatest Ingredients")
                        .font(.headline).fontWeight(.semibold).foregroundColor(Color(hue: 0.109, saturation: 0.066, brightness: 0.967)).tracking(2).padding(.bottom, 16)
                    
                    NavigationLink(destination: LogIn(), isActive: $loginIsActive) {
                        SecondaryButton(btnTitle: "Log In") {
                            loginIsActive = true
                        }.padding(.horizontal, 20).padding(.bottom, 8)
                    }
                    NavigationLink(destination: SignUp(), isActive: $signupIsActive) {
                        PrimaryButton(btnTitle: "Sign Up") {
                            signupIsActive = true
                        }.padding(.horizontal, 20)
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Image("pizza").resizable().scaledToFill().frame(width:200, height: 150).padding(.bottom, -20)
                    }
                }
            }
//            .overlay(CustomNavigation(title: "GetStarted"))
        
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView(userLoggedIn: .constant(false))
    }
}

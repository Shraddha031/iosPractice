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
    var body: some View {
        NavigationView {
            ZStack{
                Color("DarkShade").ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Image("pizzaBW").resizable().scaledToFill().frame(width:150, height: 150).padding(.trailing, -50)
                    }
                    Spacer()
                    Text("Food For You")
                    Text("With Greatest Ingredients")
                    
                    NavigationLink(destination: LogIn(), isActive: $loginIsActive) {
                        SecondaryButton(btnTitle: "Log In") {
                            loginIsActive = true
                        }.padding(.horizontal, 20)
                    }
                    NavigationLink(destination: SignUp(), isActive: $signupIsActive) {
                        PrimaryButton(btnTitle: "Sign Up") {
                            signupIsActive = true
                        }.padding(.horizontal, 20)
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Image("pizza").resizable().scaledToFill().frame(width:150, height: 150)
                    }
                }
            }
        }
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}

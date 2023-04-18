//
//  CustomNavigation.swift
//  JustEatNew
//
//  Created by Shraddha on 28/02/23.
//

import SwiftUI

struct CustomNavigation: View {
    @State private var goToProfile = false
    var title: String
    var firstBtnAction: (() -> Void)?
    var firstBtnImage: String

    var secondBtnAction: (() -> Void)?
    var secondBtnImage: String

    var thirdBtnAction: (() -> Void)?
    var thirdBtnImage: String
    
    var showBackBtn: Bool
    
    @Environment(\.presentationMode) var presentation
    var body: some View {
        ZStack{
            Color.clear
                .background(.ultraThinMaterial)
            ZStack {
                HStack{
                    if showBackBtn {
                        Button(action: {
                            self.presentation.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .font(.title3).foregroundColor(Color("DarkShade"))
                        })
                    }
                    
                    NavigationLink(destination: ProfilePage(),isActive: $goToProfile) {
                        Button(action: firstBtnAction ?? {
                            goToProfile = true
                        }, label: {
                            Image(systemName: firstBtnImage)
                                .font(.title3).foregroundColor(Color("DarkShade"))
                        })}.navigationBarBackButtonHidden(true)
                    Spacer()
                    Button(action: thirdBtnAction ?? {
                        
                    }, label: {
                        Image(systemName: thirdBtnImage)
                            .font(.title3).foregroundColor(Color("DarkShade"))
                    })
                    Button(action: secondBtnAction ?? {
                        
                    }, label: {
                        Image(systemName: secondBtnImage)
                            .font(.title3).foregroundColor(Color("DarkShade"))
                    })
                    
                }.padding(.horizontal, 20)
                HStack{
                    Text(title)
                        .font(.title3).fontWeight(.semibold)
                        .frame(maxWidth: .infinity).foregroundColor(Color("DarkShade"))
                }
            }
            
        }.frame(height: 47)
            .frame(maxHeight:.infinity, alignment: .top)
    }
}

struct CustomNavigation_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigation(title: "Welcome", firstBtnImage: "person.fill", secondBtnImage: "character.book.closed.fill", thirdBtnImage: "mappin.and.ellipse", showBackBtn: true)
    }
}

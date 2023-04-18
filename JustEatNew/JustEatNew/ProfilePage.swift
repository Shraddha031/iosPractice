//
//  ProfilePage.swift
//  JustEatNew
//
//  Created by Shraddha on 27/02/23.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var userSetting: UserSettings
    @State private var showingAlert = false
    @State private var logOutIsActive = false
    @State private var profileIsActive = false
//    @Binding var userLoggedIn:Bool
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("DarkShade"), Color("LightShade")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.top)
            VStack{
                HStack{
                    VStack(alignment:.leading){
                        Text(UserDefaults.standard.value(forKey: "userName") as? String ?? "Shraddha" )
                            .font(.title)
                            .fontWeight(.semibold).padding(.bottom,1)
                        Text(UserDefaults.standard.value(forKey: "userEmail") as? String ?? "Shraddha@gmail.com" )
                        Button(action: {
                            
                        }, label: {
                            Text("View Activity")
                                .font(.subheadline)
                            Image(systemName: "arrowtriangle.right.fill").resizable().scaledToFit().frame(width: 7,height: 7)
                        }).foregroundColor(Color("DarkShade")).fontWeight(.semibold)
                        
                    }
                    Spacer()
                    Image("profile").resizable().frame(width: 95,height: 95)
                        .overlay(Circle().stroke(Color("DarkShade"), lineWidth: 6)).padding(.vertical,16)
                }.padding(16).frame(maxWidth: .infinity).background(.white).cornerRadius(10).padding(.horizontal,16).shadow(radius: 4)
                
                List{
                    Section(header: HStack{
                        Divider().frame(width: 5, height: 38).background(Color("DarkShade"))
                        Text("Food Orders")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer()
                    }.padding(.leading,-20)){
                        HStack{
                            Image(systemName: "takeoutbag.and.cup.and.straw")
                                .padding(8)
                                .frame(width: 30, height: 30)
                                .background(Color("DarkShade")).clipShape(Circle())
                            Text("Your Orders")
                            Spacer()
                            Button(action:{
                                
                            }, label: {
                                Image(systemName: "chevron.forward").foregroundColor(.gray)
                            })
                        }.font(.callout).fontWeight(.semibold)
                        HStack{
                            Image(systemName: "a.book.closed").padding(8).frame(width: 30, height: 30).background(Color("DarkShade")).clipShape(Circle())
                            Text("Address Book")
                            Spacer()
                            Button(action:{
                                
                            }, label: {
                                Image(systemName: "chevron.forward").foregroundColor(.gray)
                            })
                        }.font(.callout).fontWeight(.semibold)
                    }.padding(4)
                    
                }.listStyle(InsetListStyle()).cornerRadius(10).padding(16)
                    .environment(\.horizontalSizeClass, .regular).shadow(radius: 4).frame(height: 250)
                List{
                    Section(header: HStack{
                        Divider().frame(width: 5, height: 38).background(Color("DarkShade"))
                        Text("More")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer()
                    }.padding(.leading,-20)){
                        HStack{
                            Image(systemName: "info.circle").resizable().scaledToFill()
                                .padding(8)
                                .frame(width: 30, height: 30)
                                .background(Color("DarkShade")).clipShape(Circle())
                            Text("About")
                            Spacer()
                            Button(action:{
                                
                            }, label: {
                                Image(systemName: "chevron.forward").foregroundColor(.gray)
                            })
                        }.font(.callout).fontWeight(.semibold)
                        
                        
                        HStack{
                            Image(systemName: "power").resizable().scaledToFill().padding(8).frame(width: 30, height: 30).background(Color("DarkShade")).clipShape(Circle())
                            Text("Log out")
                            Spacer()
                            Button(action:{
                                showingAlert = true
                                logOutIsActive = true
                            }, label: {
                                Image(systemName: "chevron.forward").foregroundColor(.gray)
                            }).alert(isPresented:$showingAlert){
                                Alert(
                                    title: Text("Are you sure you want to log out"),
                                    primaryButton: .destructive(Text("Log Out")) {
                                        print("User loggede Out...")
//                                        userLoggedIn = false
                                        userSetting.signOut()
                                        UserDefaults.standard.set(false, forKey: "loggedIn")
                                    },
                                    secondaryButton: .cancel()
                                )
                            }
                        }.font(.callout).fontWeight(.semibold)
                    }.padding(4)
                }.listStyle(InsetListStyle()).cornerRadius(10).padding(16)
                    .environment(\.horizontalSizeClass, .regular).shadow(radius: 4).frame(height: 250).listRowSeparator(.hidden)
                
                
            }
            //            .padding(16).frame(maxWidth: .infinity).background(.white).cornerRadius(10).padding(.horizontal,16).shadow(radius: 4)
            
        }
            .padding(.top,47).overlay(CustomNavigation(title: "Profile", firstBtnAction: {
                print("ABCD")
//                abkch()
            }, firstBtnImage: "person.fill", secondBtnImage: "character.book.closed.fill", thirdBtnImage: "mappin.and.ellipse", showBackBtn: true))
            
        }
//    func abkch() {
//        NavigationLink("", destination: ProfilePage(userLoggedIn: $logOutIsActive), isActive: $profileIsActive)
//    }
    
}


struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}

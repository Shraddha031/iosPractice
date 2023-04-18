//
//  ContentView.swift
//  JustEatNew
//
//  Created by Shraddha on 15/02/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var settings: UserSettings
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    var body: some View{
        ZStack{
            //            LinearGradient(gradient: Gradient(colors: [Color("DarkShade"), Color("LightShade")]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            //                     }
            NavigationView{
                if settings.loggedIn || UserDefaults.standard.bool(forKey: "loggedIn"){
                    MainView().onAppear(){
                        for user in users{
                            if user.email == UserDefaults.standard.value(forKey: "userEmail") as? String {
                                settings.setUser(user: user)
                            }
                        }
                    }
                }
                else{
                    GetStartedView(userLoggedIn: $settings.loggedIn )
                }
            }
        }
    
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserSettings())
    }
}

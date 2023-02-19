//
//  ContentView.swift
//  JustEatNew
//
//  Created by Shraddha on 15/02/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View{
        ZStack{
            //            LinearGradient(gradient: Gradient(colors: [Color("DarkShade"), Color("LightShade")]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            //                     }
            GetStartedView()
        }
    
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

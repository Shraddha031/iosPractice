//
//  GroceryPage.swift
//  JustEatNew
//
//  Created by Shraddha on 22/02/23.
//
import SwiftUI
import CoreData
struct GroceryPage: View {
    var body: some View{
        VStack{
            ScrollView{
                Text("Groceries in  minutes!").font(.largeTitle).fontWeight(.heavy).padding(16)
                Image("Map")
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height * 0.25)
                    .padding(.leading,-12).padding(.trailing,-12)
                VStack{
                    Image("BlinkitLogo").resizable().scaledToFill().frame(width:100, height: 100).padding(.top,16)
                    Text("India's Last Minute App")
//                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading).font(.system(size: 25)).padding(.top,16).padding(.bottom,6)
                    HStack{
                        Text("Get").fontWeight(.medium)
                        Text("₹ 100 OFF")
                            .fontWeight(.bold)
                        Text("&").fontWeight(.medium)
                        Text("free delivery").fontWeight(.bold)
                        
                    }.font(.system(size:20)).padding(.bottom,6)
                    HStack{
                        Text("Use code")
                        Text("WELCOME100").foregroundColor(Color("GreenShade")).fontWeight(.semibold)
                        Text("on your first order")
                    }.font(.system(size:15)).padding(.bottom,18)
                    ThirdButton(btnTitle: "Open Blinkit App"){
                    }.padding(8)
                    Text("✓ App already Installed").font(.callout).fontWeight(.semibold).foregroundColor(Color("GreenShade")).padding(.bottom,20)                }.padding(8).background(Color("LightBackground")).frame(width: UIScreen.main.bounds.width - 40).cornerRadius(20).overlay {
                        RoundedRectangle(cornerRadius: 25, style: .continuous).stroke( Color("BorderLight"),lineWidth: 1)
                    }
                HStack{
                    Image(systemName: "star.fill").font(.system(size: 12))
                    Text("ENJOY THESE BENEFITS").font(.body).font(.system(size: 8))
                    Image(systemName: "star.fill").font(.system(size: 12))
                }.padding(.top, 32).padding(.bottom, 16).tracking(3)
                GroceryList("GroceryIcon", "Enjoy 5000+ products to suit", "your needs").padding(.bottom, 16)
                GroceryList("clock3", "Everything deliverd", "in minutes").padding(.bottom, 16)
                GroceryList("priceTag", "Amazing payment and", "bank offers").padding(.bottom, 32)
                
            }
            
//            LinearGradient(gradient: Gradient(colors: [Color("DarkShade"), Color("LightShade")]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()

                                 

        }.padding(.top,47).overlay(CustomNavigation(title: "Just Eat It", firstBtnImage: "person.fill", secondBtnImage: "character.book.closed.fill", thirdBtnImage: "mappin.and.ellipse", showBackBtn: false))
    
    }
}



struct GroceryPage_Previews: PreviewProvider {
    static var previews: some View {
        GroceryPage()
    }
}

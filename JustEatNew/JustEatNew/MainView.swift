//
//  MainView.swift
//  JustEatNew
//
//  Created by Shraddha on 22/02/23.
//

import SwiftUI

struct MainView: View {
    @State private var tabSelected = 0
    @State private var returnData: [hotelModel] = []
    @State private var returnDish: [DishModel] = []
    @State private var dataLoading = false
    @State private var dataLoad1 = false
    @State private var dataLoad2 = false
    var body: some View {
        if dataLoad1 && dataLoad2{
            TabView(selection: $tabSelected){
                DeliveryPage(temp: returnData, temp2: returnDish, restaurants: returnData)
                    .tabItem{
                        Label("Delivery", systemImage: "scooter")
                    }.tag(0)
                GroceryPage()
                    .tabItem{
                        Label("Grocery", systemImage: "takeoutbag.and.cup.and.straw.fill")
                    }.tag(1)
                CartView(tabSelected: $tabSelected)
                    .tabItem{
                        Label("Cart", systemImage: "cart.fill")
                    }.tag(2)
            }}
        else{
            ProgressView("Loading data")
            .onAppear(){
                NetworkManager.shared.requestForApi(urlString: "https://retoolapi.dev/UY30s0/hum_name_rahe_hum_jo_the_kabhi", completionHandler: {
                    data in
                    guard let values = data as? [[String:Any]] else {return}
                    self.returnData = values.map{hotelModel(data: $0)}
                    dataLoad1 = true
                })
                NetworkManager.shared.requestForApi(urlString: "https://retoolapi.dev/kzWdFZ/jaimatadi", completionHandler: {
                    data in
                    guard let data = data as? [[String:Any]] else {return}
                    self.returnDish = data.map{DishModel(data: $0)}
                    returnDish = Array(returnDish[0...19])
                    dataLoad2 = true
                })
                
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

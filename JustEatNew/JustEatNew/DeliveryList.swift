//
//  DeliveryList.swift
//  JustEatNew
//
//  Created by Shraddha on 22/02/23.
//

import SwiftUI

struct FoodItem {
    var uniqueID : Int
    var veg: Bool
    var name: String
    var price1: Int
    var quatity: String
    var itemVal = 1
    var price2: Int
}

struct extraList {
    var uniqueID : Int
    var image1: String
    var listName: String
}

var extraLists = [
    extraList(uniqueID: 1, image1: "plus.circle", listName: "Add more items"),
    extraList(uniqueID: 2, image1: "square.and.pencil", listName: "Add cooking instructions"),
    extraList(uniqueID: 3, image1: "fork.knife", listName: "Don't send cutlery with this order")
]
func addItem(){
    
}
//struct DeliveryList: View {
//    @State private var counter: Int = 2
//    var body: some View {
//        List(FoodItems, id: \.uniqueID) { FoodItem in
//            HStack{
//                if FoodItem.veg{
//                    Image("Veg").resizable().scaledToFit().frame(width: 15,height: 15)
//                }else{
//                    Image("NonVeg").resizable().scaledToFit().frame(width: 12,height: 12)
//                }
//                VStack{
//                    HStack{
//                        Text(FoodItem.name)
//                        Spacer()
//                    }
//                    HStack{
//                        Text("₹ \(FoodItem.price)")
//                        Spacer()
//                    }
//                    
//                }
//                VStack{
//                    HStack{
//                        Button(action: {
//                            counter = counter - 1
//                        }, label: {
//                            Text("-")
//                        }).tint(.pink)
//                        Text(String(counter)).font(.system(size: 15))
//                        Button(action: {
//                            counter = counter + 1
//                        }, label: {
//                            Text("+")
//                        }).tint(.pink)
//                        
//                    }.frame(width: 60, height: 25).background(Color("LightShade")).cornerRadius(5)
//                    HStack{
//                        Text("₹ \(FoodItem.price)").font(.system(size: 13))
//                    }
//                }
//            }
//            .listStyle(.grouped)
//            .listRowSeparator(.hidden)
//        }
//    }
//}
//
//struct DeliveryList_Previews: PreviewProvider {
//    static var previews: some View {
//        DeliveryList()
//    }
//}

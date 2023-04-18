//
//  restaurantDetailPage.swift
//  JustEatNew
//
//  Created by Shraddha on 06/03/23.
//

import SwiftUI

struct restaurantDetailPage: View {
    @EnvironmentObject var settings: UserSettings
    @State private var showAlert = false
    @State private var addedToCart = false
    @State private var showCartNoEmptyAlert = false
    @State private var currentItemId: String = "0"
    var restaurant: [DishModel]
    var hotel: hotelModel
    @State private var qunatity = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @State private var cartItems: [Cart] = []
    var body: some View {
        ZStack{
        List{
            HStack{
                VStack(alignment: .leading){
                    Text(hotel.name!).font(.system(size: 33)).fontWeight(.semibold)
                    Text(getCategory(hotel.category!))
                        .font(.callout)
                    Text(hotel.address!)
                        .font(.callout)
                    HStack{
                        Image("Timer").resizable().scaledToFit().frame(width: 20, height: 20)
                        Text("Delivery in")
                            .fontWeight(.medium)
                        Text("\(getEstimatedTime(hotel.distance!)) | \(hotel.distance!) km away")
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
                VStack{
                    VStack{
                        HStack {
                            Text(hotel.rating!).font(.system(size: 20).weight(.bold)).padding(.leading, 4)
                        }.padding(.vertical,2)
                    }.padding(7).background(Color(hue: 0.302, saturation: 0.886, brightness: 0.448)).foregroundColor(.white).cornerRadius(15,corners: [.topLeft, .topRight])
                    VStack{
                        Text(getTotalReviews(restaurant)).padding(.top, -4)
                            .font(.callout)
                        Text("Reviews")
                            .font(.footnote)
                    }
                }.overlay {
                    RoundedRectangle(cornerRadius: 15, style: .continuous).stroke( Color("lightGray"),lineWidth: 1)
                }
            }.contentShape(Rectangle())
                .onTapGesture {
                    showAlert = true
                }
                .padding().frame(maxWidth: .infinity).background(.white).cornerRadius(10).shadow(radius: 4)
            ForEach(restaurant, id: \.id){
                data in
                DishRow(showCartNoEmptyAlert: $showCartNoEmptyAlert, caurrentDishItem: $currentItemId, restaurantId: String(hotel.id!), distance: hotel.distance!, dish: data, incrementAction: {
                    updateCartItems(id: String(data.id!), inc: true)
                }, decrementAction: {
                    updateCartItems(id: String(data.id!), inc: false)
                }, addBtnAction: {
                    addToCart()
                }, itemQuanity: qunatity[data.id! - 1])
            }
        }.listStyle(.plain).onAppear{
            if settings.user.restaurantId == String(hotel.id!) {
                if let items = settings.user.cartItem?.allObjects as? [Cart] {
                    self.cartItems = items
                    for item in self.cartItems {
                        qunatity[Int(item.cartId!)! - 1] = Int(exactly: item.qauntity)!
                    }
                }
                
            }
        }
            if showCartNoEmptyAlert {
                VStack{
                    Image("dustbin").resizable().scaledToFill().frame(width: 100, height: 100)
                    Text("There are already items added in the cart from different restaurant")
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center).padding(.bottom,4)
                    Text("Do you want to remove it?")
                        .font(.body)
                        .fontWeight(.semibold)
                    HStack{
                        Button(action: {
                            showCartNoEmptyAlert = false
                        }, label: {
                            Text("Cancel").bold()
                        }).padding().frame(width: 140, height: 50)
                            .foregroundColor(.white).overlay {
                                RoundedRectangle(cornerRadius: 15, style: .continuous).stroke(Color("DarkShade"),lineWidth: 3)
                            }.background(Color("DarkShade")
                            ).cornerRadius(15)
                        Button(action: {
                            showCartNoEmptyAlert = false
                            removeFromCart()
                        }, label: {
                            Text("Empty Cart").bold()
                        }).padding().frame(width: 140, height: 50)
                            .foregroundColor(.white).overlay {
                                RoundedRectangle(cornerRadius: 15, style: .continuous).stroke(Color("DarkShade"),lineWidth: 3)
                            }.background(Color("DarkShade")
                            ).cornerRadius(15)
                    }
                }.padding(8).frame(width: UIScreen.main.bounds.width - 40).overlay {
                    RoundedRectangle(cornerRadius: 25, style: .continuous).stroke( Color("LightShade"),lineWidth: 1)
                }.background(Color("LightShade")).cornerRadius(25)
            }
    }
    }
    func removeFromCart(){
        settings.user.cartItem = []
        settings.user.restaurantId = String(hotel.id!)
        addToCart()
        
    }
    func updateCartItems(id: String, inc: Bool) {
        var ind: Int = 0
        for i in 0..<cartItems.count {
            if cartItems[i].cartId == id {
                ind = i
                break
            }
        }
        
        if inc {
            cartItems[ind].qauntity = cartItems[ind].qauntity + 1
            qunatity[Int(currentItemId)! - 1] += 1
        } else {
            if qunatity[Int(currentItemId)! - 1] == 1 {
                deleteCartItem(id: currentItemId)
                qunatity[Int(currentItemId)! - 1] -= 1
            } else {
                cartItems[ind].qauntity = cartItems[ind].qauntity - 1
                qunatity[Int(currentItemId)! - 1] -= 1
            }
        }
        PersistenceController.shared.save()
        settings.refreshCart()
    }
    func deleteCartItem(id: String) {
        var ind = -1
        for i in 0..<cartItems.count {
            if(cartItems[i].cartId == id) {
                ind = i
                break
            }
        }
        if ind != -1 {
            PersistenceController.shared.deleteCartItems(item: cartItems[ind])
            cartItems.remove(at: ind)
            settings.user.cartItem?.adding(cartItems)
            settings.setCartItems(items: cartItems)
            PersistenceController.shared.save()
        } else {
            print("ID not found")
        }
    }
    
    
    func addToCart() {
        for food in restaurant {
            if String(food.id!) == currentItemId {
                if (settings.user.cartItem?.count == 0 || String(hotel.id!) == settings.user.restaurantId ?? "0") {
                    qunatity[Int(currentItemId)! - 1] += 1
                    settings.user.restaurantId = String(hotel.id!)
                    PersistenceController.shared.saveCartItems(data: ["name": food.name!, "veg": food.isVeg!, "price": food.price!, "user": settings.user, "distance": hotel.distance!, "currentRestaurant": String(hotel.id!), "cartId": String(food.id!)])
                    if let items = settings.user.cartItem?.allObjects as? [Cart] {
                        self.cartItems = items
                    }
                } else {
                    showCartNoEmptyAlert = true
                }
            }
        }
    }
    func getTotalReviews(_ dishes: [DishModel]) -> String{
        var sum = 0;
        for j in dishes {
            sum += Int(j.totalVotes!)!
        }
        return String(sum)
    }
    func getEstimatedTime(_ distance: String) ->String{
        let t = 10 + (Int(distance)! * 5)
        return "\(t) - \(t-5) min"
    }
    func getCategory(_ category: String) -> String{
        switch(category){
        case "1":
            return "North Indian"
        case "2":
            return "South Indian"
        case "3":
            return "Pizza and Burgers"
        case "4":
            return "Dessert"
        case "5":
            return "Chinese"
        case "6":
            return "Starters"
        default:
            return "All"
        }
    }
} 

//struct restaurantDetailPage_Previews: PreviewProvider {
//    static var previews: some View {
//        restaurantDetailPage(restaurant: [DishModel(data: [
//
//            "D": false,
//
//            "F": "3",
//
//            "G": "250",
//
//            "H": true,
//
//            "I": "Huntersville, North Carolina, United States",
//
//            "id": 1,
//
//            "col1": "2",
//
//            "rating": "⭐️",
//
//            "fullName": "Sagar Ratna",])], hotel: hotelModel(data: [
//
//                "D": "Shakes",
//
//                    "E": "150",
//
//                    "G": "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fmilk-shake&psig=AOvVaw1O74IwZJMMMQ9jD_LOhePZ&ust=1678262309447000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCMip_7esyf0CFQAAAAAdAAAAABAZ",
//
//                    "id": 1,
//
//                    "col1": "⭐️⭐️⭐️⭐️⭐️",
//
//                    "col2": "sweet beverage made by blending milk, ice cream, and flavorings or sweeteners such as butterscotch, caramel sauce, chocolate syrup, fruit syrup, or whole fruit into a thick, sweet, cold mixture.",
//
//                    "col3": "250",
//
//                    "isUser": true
//
//            ]))
////        restaurantDetailPage(restaurant: DishModel(data: [
////
////            "D": false,
////
////            "F": "3",
////
////            "G": "250",
////
////            "H": true,
////
////            "I": "Huntersville, North Carolina, United States",
////
////            "id": 1,
////
////            "col1": "2",
////
////            "rating": "⭐️",
////
////            "fullName": "Sagar Ratna",]), hotel: [hotelModel(data: [
////
////                "D": "Shakes",
////
////                    "E": "150",
////
////                    "G": "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fmilk-shake&psig=AOvVaw1O74IwZJMMMQ9jD_LOhePZ&ust=1678262309447000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCMip_7esyf0CFQAAAAAdAAAAABAZ",
////
////                    "id": 1,
////
////                    "col1": "⭐️⭐️⭐️⭐️⭐️",
////
////                    "col2": "sweet beverage made by blending milk, ice cream, and flavorings or sweeteners such as butterscotch, caramel sauce, chocolate syrup, fruit syrup, or whole fruit into a thick, sweet, cold mixture.",
//
//                    "col3": "250",
//
//                    "isUser": true
//
////            ])])
//    }
//}
//}

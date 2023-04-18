//
//  DishRow.swift
//  JustEatNew
//
//  Created by Shraddha on 06/03/23.
//

import SwiftUI

struct DishRow: View {
    @EnvironmentObject var settings: UserSettings
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
    @State private var isExpanded = false
    @State private var changing = false
    @State private var price: Int = 433
    @State private var buttonDisable = false
    @State private var showDSSAlert = false
    @Binding var showCartNoEmptyAlert: Bool
    @Binding var caurrentDishItem: String
    @State
    var restaurantId: String
    var distance: String
    var dish: DishModel
    var incrementAction: (()->())
    var decrementAction: (()->())
    var addBtnAction: (()->())
    var itemQuanity: Int
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Image(systemName: "dot.square")
                    .foregroundColor(dish.isVeg == "true" ? Color(hue: 0.302, saturation: 0.886, brightness: 0.448): Color.red).font(.system(size: 20))
                Text(dish.name!).font(.title3).fontWeight(.semibold)
                HStack{
                    VStack{
                        HStack {
                            Text("\(dish.rating!)").font(.subheadline.weight(.bold)).padding(.leading, 4)
                            //                            Image(systemName: "star.fill").font(.footnote)
                        }.padding(.vertical,2)
                    }.padding(2.5).background(Color(hue: 0.302, saturation: 0.886, brightness: 0.448)).foregroundColor(.white).cornerRadius(5)
                    Text("\(dish.totalVotes!) ratings")
                        .font(.callout).fontWeight(.semibold).foregroundColor(Color(hue: 1.0, saturation: 0.019, brightness: 0.348))
                    
                    
                }
                Text("₹\(dish.price!)")
                    .font(.callout)
                    .fontWeight(.medium)
                HStack {
                    Text("\(dish.description!)").lineLimit(isExpanded ? nil : 3)
                        .animation(.easeOut)
                }
                footer
                
            }
            Spacer()
            VStack{
                //                AsyncImage(url: URL(string: "\(dish.image!)")){
                Image("paneer").resizable().scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.2).cornerRadius(20).clipped()
                if itemQuanity == 0{
                    VStack{
                        Button(action: {
                            
                        }, label: {
                            Text("ADD+")
                        }).onTapGesture {
                            caurrentDishItem = String(dish.id!)
                            addBtnAction()
                            
                        }
                        .font(.system(size: 21))
                        .fontWeight(.semibold).foregroundColor(buttonDisable ?  Color(.gray): Color("DarkShade"))
                    }.frame(width: UIScreen.main.bounds.width * 0.28, height: UIScreen.main.bounds.height * 0.047 ).overlay {
                        RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(buttonDisable ?  Color(.gray): Color("DarkShade"),lineWidth: 1)
                    }.background(buttonDisable ? Color("lightGray"): Color("LightShade") ).cornerRadius(10).padding(.top,-20).disabled(buttonDisable)
                }else{
                    HStack {
                        Button("-", action: decrementAction).tint(Color("DarkShade"))
                            .onTapGesture {
                                caurrentDishItem = String(dish.id!)
                                decrementAction()
                            }
                        Text(String(itemQuanity)).fontWeight(.bold)
                            .padding(.horizontal, 4)
                        Button("+", action: incrementAction).tint(Color("DarkShade"))
                            .onTapGesture {
                                caurrentDishItem = String(dish.id!)
                                incrementAction()
                            }
                    }.font(.title).foregroundColor(Color("DarkShade"))
                        .padding(.horizontal, 16).padding(.vertical, 2)
                        .background(Color("LightShade"))
                        .cornerRadius(5)
                        .overlay (
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(Color("LightShade"), lineWidth: 2)
                        ).padding(.top, -24)
            }
        }.padding(.leading,5)
            
    }.padding(.top, 10).padding(.bottom, 20)
    }
    private var footer: some View {
        HStack {
            Button {
                changing = true // We change the chevron…
                isExpanded.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    changing = false    // Change is done
                }
                
            } label: {
                Text("read more").font(.callout).fontWeight(.bold).foregroundColor(Color(hue: 1.0, saturation: 0.012, brightness: 0.397))
            }
            
        }
        
    }
//    func addToCart(){
////        PersistenceController.shared.saveCartItems(data: ["name": dish.name!, "veg": dish.isVeg!, "price": dish.price!, "user": settings.user, "distance": distance, "currentRestaurant": restaurantId])
//        caurrentDishItem = String(dish.id!)
//        if (settings.user.cartItem?.count == 0 || restaurantId == settings.user.restaurantId ?? "0"){
//            settings.user.restaurantId = restaurantId
//            buttonDisable = true
//            PersistenceController.shared.saveCartItems(data: ["name": dish.name!, "veg": dish.isVeg!, "price": dish.price!, "user": settings.user, "distance": distance, "currentRestaurant": restaurantId, "cartId": String(dish.id!)])
//        }else{
//            showCartNoEmptyAlert = true
//            showDSSAlert = true
//            print("cartNotempty")
//        }
//    }
}

//struct DishRow_Previews: PreviewProvider {
//    static var previews: some View {
//        DishRow(distance: "3", dish: DishModel(data: ["D":"Cake",
//                                                      "E":"250",
//                                                      "G":"https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.bakingo.com%2Fp%2Fcake%2Fchoco-vanilla-cake0006chva&psig=AOvVaw1VhPG9RDvZQUAvXKMX7T3E&ust=1678262654733000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCKiJrt2tyf0CFQAAAAAdAAAAABAG",
//                                                      "col1":"\u{2b50}\u{fe0f}\u{2b50}\u{fe0f}",
//                                                      "col2":"Chocolate, Truffle, Vanilla, Butterscotch, Black Forest, Red Velvet Birthday Cakes & More",
//                                                      "col3":"875",
//                                                      "id": 8,
//                                                      "isUser":true]))
//    }
//}

//HStack{
//    Text("+").font(.system(size: 14))
//        .fontWeight(.semibold).foregroundColor(Color("DarkShade"))
//}

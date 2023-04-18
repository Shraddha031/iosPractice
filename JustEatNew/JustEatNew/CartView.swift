

import SwiftUI

struct CartView: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var settings: UserSettings
    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
    @State private var refreshId = UUID()
    @State private var deliveryTime: String = "25-30"
    @State private var counter: Int = 2
    @State private var totalValue: Int = 543
    @State private var gstValue: Double = 80.25
    @State private var deliveryValue: Double = 68.00
    @State private var grandTotal: Int = 68
    @State private var showDetails = false
    @State private var showAlert = false
    @State private var currentCartId: String?
    @State private var emptyCartPage = false
    @State private var deliveryDistance: Int = 6
    @Binding var tabSelected: Int
    @State private var cartItemss: [Cart] = []
    @State var FoodItems = [
        FoodItem(uniqueID:1, veg: true, name: "Butterscotch Nuts Cake", price1: 445, quatity: "[500gm]",price2: 445),
        FoodItem(uniqueID:2, veg: false, name: "Butter Chicken", price1: 1000, quatity: "1 kg",price2: 445),
        FoodItem(uniqueID:3, veg: false, name: "Oreo Waffle", price1: 500, quatity: "Single",price2: 445)
    ]
//    Global current List item
    
    
    //  For bottom menu
      @State private var currentPaymentWay = "Wallet"
      @State private var currentPaymentImage = "menubar.dock.rectangle"
    //  For placeorder button
      @State private var totalAmount = 425.25
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("DarkShade"), Color("LightShade")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.top)
            if cartItemss.count == 0{
                VStack{
                    Image("emptyCart").resizable().frame(width: 100, height: 100)
                    Text("Ooops Your cart is empty").font(.subheadline).fontWeight(.bold)
                    Text("Looks like you haven't added anything to your cart yet").font(.caption).padding(.bottom,32)
                    Button(action: {
                        tabSelected = 0
                    }, label: {
                        Text("Explore Restaurants").foregroundColor(Color("DarkShade")).fontWeight(.bold).font(.body)
                    })
                }.onAppear(){
                    if let items = settings.user.cartItem?.allObjects as? [Cart]{
                        self.cartItemss = items
//                        deliveryDistance =
                    }
                }
                
            }else{
                VStack{
                    ScrollView(showsIndicators: false) {
                        HStack{
                            Image("Timer").resizable().scaledToFit().frame(width: 20, height: 20)
                            Text("Delivery in")
                                .fontWeight(.medium)
                            Text("\(deliveryTime) min")
                                .fontWeight(.bold)
                            Spacer()
                        }.padding(16).frame(maxWidth: .infinity).background(.white).cornerRadius(15).padding(.bottom, 32)
                        HStack{
                            VStack{
                                Divider().background(.red)
                            }
                            Text("ITEM(S) ADDED").fontWeight(.medium).tracking(2).frame(width: 150).font(.system(size: 15))
                            VStack{
                                Divider().background(.red)
                            }
                        }
                        VStack{
                            ForEach(cartItemss,id: \.self){ FoodItem in
                                HStack{
                                    if FoodItem.isVeg{
                                        Image("Veg").resizable().scaledToFit().frame(width: 15,height: 15).padding(.top,-23)
                                    }else{
                                        Image("NonVeg").resizable().scaledToFit().frame(width: 12,height: 12).padding(.top,-23)
                                    }
                                    VStack{
                                        HStack{
                                            Text(FoodItem.name ?? "optional").font(.callout).fontWeight(.semibold)
                                            Spacer()
                                        }.padding(.bottom,0.5)
                                        HStack{
                                            Text("₹ \(FoodItem.price ?? "0")")
                                                .font(.footnote)
                                                .fontWeight(.bold)
                                            Spacer()
                                        }.padding(.bottom,1)
                                        HStack{
                                            Text("\(FoodItem.distance ?? "1") km far away")
                                                .font(.caption2)
                                                .fontWeight(.regular)
                                            Spacer()
                                        }
                                        
                                    }.padding(.top,8)
                                    VStack{
                                        HStack{
                                            Button(action: {
                                                currentCartId = FoodItem.cartId
                                                FoodItem.qauntity == 1 ? showAlert = true : updateCartItems(id: FoodItem.cartId ?? String(0), inc:false )
//                                                FoodItem.itemVal == 1 ? showAlert = true :
//                                                updateCartItems(id: FoodItem.id, inc: false)
                                                updateTotal()
                                            }, label: {
                                                Text("-")
                                            }).tint(Color("DarkShade"))
                                            Text(String("\(FoodItem.qauntity)")).font(.system(size: 15))
                                            Button(action: {
                                                 updateCartItems(id: FoodItem.cartId ?? String(0), inc: true)
                                            }, label: {
                                                Text("+")
                                            }).tint(Color("DarkShade"))
                                            
                                        }.alert(isPresented: $showAlert) {
                                            Alert(
                                                title: Text("Are you sure you want to delete this?"),
                                                message: Text("There is no undo"),
                                                primaryButton: .destructive(Text("Delete")) {
                                                    print("Deleting...")
                                                    deleteCartItem(id: currentCartId!)
                                                },
                                                secondaryButton: .cancel()
                                            )
                                        }
                                        .frame(width: 60, height: 25).overlay {
                                            RoundedRectangle(cornerRadius: 25, style: .continuous).stroke( Color("DarkShade"),lineWidth: 1)
                                        }.background(Color("LightShade")).cornerRadius(25)
                                        HStack{
                                            Text("₹ \(Int64(FoodItem.price ?? "0")! * FoodItem.qauntity)").font(.system(size: 13))
                                        }
                                    }
                                }
                            }
                        }.id(refreshId)
                        .padding(16).frame(maxWidth: .infinity).background(.white).cornerRadius(15).padding(.bottom, 16)
                        VStack{
                            ForEach(extraLists, id: \.uniqueID){
                                extraList in
                                HStack{
                                    if(extraList.uniqueID == 3){
                                        Image(systemName: extraList.image1).foregroundColor(.green)
                                    }else{
                                        Image(systemName: extraList.image1).padding(.top,5)
                                    }
                                    HStack{
                                        Text(extraList.listName).font(.callout)
                                        Spacer()
                                    }.padding(.top,5)
                                    if(extraList.uniqueID == 3){
                                        Button(action:{
                                            
                                        }, label: {
                                            Image(systemName: "checkmark.square.fill").foregroundColor(.green)
                                        }).padding(.trailing,4)
                                    }else{
                                        Button(action:{
                                            
                                        }, label: {
                                            Image(systemName: "chevron.forward").foregroundColor(.gray)
                                        }).padding(.trailing,8)
                                        
                                    }
                                }.padding(8).onTapGesture{
                                    tabSelected = 0
                                }
                                VStack{
                                    Divider()
                                }
                            }
                        }.frame(maxWidth: .infinity).background(.white).cornerRadius(15).padding(.bottom, 32)
                        //
                        HStack{
                            VStack{
                                Divider().background(.red)
                            }
                            Text("BILL SUMMARY").fontWeight(.medium).tracking(2).frame(width: 150).font(.system(size: 15))
                            VStack{
                                Divider().background(.red)
                            }
                        }
                        //
                        VStack{
                            HStack{
                                Text("Subtotal")
                                Spacer()
                                Text(String("₹\(totalValue)"))
                            }.fontWeight(.bold).font(.system(size: 18)).padding(8)
                            HStack{
                                Image(systemName: "building.columns")
                                Text("GST and restaurant charges")
                                Spacer()
                                Text("₹\(gstValue, specifier: "%.2f")")
                            }.font(.system(size: 15)).padding(4)
                            HStack{
                                Image(systemName: "scooter")
                                Text("Delivery partner fee for \(deliveryDistance) km")
                                Spacer()
                                Text(("₹\(deliveryValue, specifier: "%.2f")"))
                            }.font(.system(size: 15)).padding(4)
                            Text("fully goes to them for their time and effort").fontWeight(.medium).frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 13)).foregroundColor(.gray).padding(.leading, 25)
                            HStack{
                                Button(action: {
                                    showDetails.toggle()
                                }, label: {
                                    Text("See how this is calculated").font(.callout)
                                    Image(systemName: "arrowtriangle.down.fill").resizable().frame(width: 8, height: 6)
                                }).tint(Color("DarkShade")).frame(width: 230, height: 30).overlay {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color("DarkShade"),lineWidth: 1)
                                }.padding(.leading, 25).padding(.bottom,8)
                                Spacer()
                            }
                            if showDetails{
                                VStack{
                                    HStack{
                                        Text("Base Fee")
                                        Spacer()
                                        Text("₹31")
                                    }.padding(.bottom, 6).font(.callout)
                                    HStack{
                                        Text("Long Distance fee")
                                        Spacer()
                                        Text("₹25")
                                    }.padding(.bottom, 1).font(.callout)
                                    
                                    HStack{
                                        Text("charged from 5 km onwards")
                                        Spacer()
                                    }.font(.footnote).foregroundColor(.gray)
                                }.padding(8).background(Color("lightestGray")).cornerRadius(5).padding(.leading, 16).padding(.trailing,16)
                            }
                            Divider()
                            HStack{
                                Text("Grand Total").frame(maxWidth: .infinity, alignment: .leading)
                                Text("₹\(grandTotal)")
                            }.fontWeight(.semibold)
                        }.padding(16).frame(maxWidth: .infinity).background(.white).cornerRadius(15).padding(.bottom,16)
                        //
                        HStack{
                            VStack{
                                HStack{
                                    HStack{
                                        Text("Your Details").font(.callout).fontWeight(.semibold)
                                        Spacer()
                                    }
                                    Button(action: {
                                        
                                    }, label: {
                                        Image(systemName: "chevron.forward")
                                    }).padding(.top,16).foregroundColor(.gray)
                                }
                                HStack{
                                    Text("Shanaya Sinha,1234567").font(.callout).fontWeight(.semibold).foregroundColor(.gray)
                                    Spacer()
                                }
                                
                                
                            }.padding(8)
                        }.frame(maxWidth: .infinity).background(.white).cornerRadius(15).padding(.bottom,16)
                        //
                        HStack{
                            VStack{
                                HStack{
                                    HStack{
                                        Text("Order for someone else").font(.callout).fontWeight(.semibold)
                                        Spacer()
                                    }
                                    Button(action: {
                                        
                                    }, label: {
                                        Image(systemName: "chevron.forward")
                                    }).padding(.top,16).foregroundColor(.gray)
                                }
                                HStack{
                                    Text("Send personalized message").font(.callout).fontWeight(.semibold).foregroundColor(.gray)
                                    Spacer()
                                }
                                
                                
                            }.padding(8)
                        }.frame(maxWidth: .infinity).background(.white).cornerRadius(15).padding(.bottom, 16)
                        //
                        HStack{
                            VStack{
                                Divider().background(.red)
                            }
                            Text("CANCELLATION POLICY").fontWeight(.medium).tracking(2).frame(width: 220).font(.system(size: 15))
                            VStack{
                                Divider().background(.red)
                            }
                        }
                        //
                        HStack{
                            Text("100% cancellation fee will be applicable if you decide to cancel the order anytime after order placement.Avoid cancellation as it leads to food wastage")
                                .font(.callout).foregroundColor(.gray)
                        }.padding(8).frame(maxWidth: .infinity).background(.white).cornerRadius(15).padding(.bottom, 32)
                    }.padding(16)
                    
                    // Bottom Placement View
                    VStack { // Bottom Payment Option
                        VStack { // Location Change
                            HStack {
                                Image(systemName: "mappin.and.ellipse").resizable().scaledToFit().frame(width: 20,height: 20)
                                    .foregroundColor(Color("DarkShade"))
                                Text("Delivery at")
                                    .font(.subheadline)
                                Text("Work")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Spacer()
                                Button("Change") {
                                    Image(systemName: "location.circle.fill")            }.foregroundColor(Color("DarkShade"))
                            }
                            Text("Rapipay, 8 Floor, QA Infotech, Block A, sector 68, Noida")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                                .lineLimit(1)
                                .padding(.horizontal, 24)
                        }.padding(.horizontal, 24)
                        Divider()
                        VStack { // Place order button view
                            HStack {
                                VStack { // FOR Payusing and its label
                                    HStack {
                                        Image(systemName: currentPaymentImage)
                                            .font(.callout)
                                            .foregroundColor(Color.gray)
                                        Menu("PAY USING ▲") {
                                            Button("Wallet") {
                                                currentPaymentWay = "Wallet"
                                                currentPaymentImage = "menubar.dock.rectangle"
                                            }
                                            Button("COD") {
                                                currentPaymentWay = "COD"
                                                currentPaymentImage = "indianrupeesign.circle.fill"
                                            }
                                        }
                                        .foregroundColor(Color.gray)
                                        .font(.subheadline)
                                    }
                                    Text(currentPaymentWay)
                                        .font(.caption)
                                }
                                VStack { // FOR Paynow button
                                    Button(action: {
                                    }) {
                                        HStack{
                                            VStack{
                                                Text("₹ \(grandTotal)")
                                                    .fontWeight(.bold)
                                                    .foregroundColor(Color.white)
                                                Text("TOTAL")
                                                    .foregroundColor(Color.white)
                                                    .font(.caption).padding(.leading,-20)
                                            }.padding(.leading, 12)
                                            Spacer()
                                            Text("Place Order ►")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                            Spacer()
                                        }
                                    }
                                    .padding(.vertical, 12)
                                    .background(Color("DarkShade"))
                                    .cornerRadius(8)
                                }
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 24)
                            Divider()
                        }.onAppear(){
                            updateBillingDetails()
                        }
                    }
                    .padding(.top, 12)
                    .background(Color.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                }
            }
        }.padding(.top,47).overlay(CustomNavigation(title: "Your Cart", firstBtnImage: "person.fill", secondBtnImage: "character.book.closed.fill", thirdBtnImage: "mappin.and.ellipse", showBackBtn: false))
            .onAppear(){
                if let items = settings.user.cartItem?.allObjects as? [Cart]{
                    self.cartItemss = items
                    deliveryDistance = getMaxDistance()
                }
            }

            
    }
    func updatingCartCoreData(){
        for j in users{
            if j.email == UserDefaults.standard.value(forKey: "userEmail") as? String{
                cartItemss = j.cartItem!.allObjects as! [Cart]
            }
        }
    }
    func updateCartItems(id: String, inc: Bool){
        var ind: Int = 0
        for i in 0..<cartItemss.count {
            if cartItemss[i].cartId == id{
                ind = i
                break
            }
        }
        if inc {
            cartItemss[ind].qauntity = cartItemss[ind].qauntity + 1
            
        }else{
            cartItemss[ind].qauntity = cartItemss[ind].qauntity - 1
        }
        refreshId = UUID()
        PersistenceController.shared.save()
        updateBillingDetails()
    }
    func deleteCartItem(id: String){
        var ind = -1
        for i in 0..<cartItemss.count {
            if cartItemss[i].cartId == id{
                ind = i
                break
            }
        }
        if ind != -1{
            PersistenceController.shared.deleteCartItems(item: cartItemss[ind])
            cartItemss.remove(at: ind)
            print(cartItemss.count)
//            settings.setCartItems(items: cartItemss)
            PersistenceController.shared.save()
        }else{
            print("ID not found")
        }
        refreshId = UUID()
        updateBillingDetails()
    }
    func getMaxDistance() -> Int{
        var dis = 0
        for i in cartItemss{
            if dis < Int(i.distance!)!{
                dis = Int(i.distance!)!
            }
        }
        return dis
    }
    func updateBillingDetails(){
        deliveryDistance = getMaxDistance()
        var newSubTotal = 0.0
        for item in cartItemss{
            newSubTotal += Double(item.qauntity * Int64(item.price!)!)
        }
        totalValue = Int(newSubTotal)
        gstValue = 0.18 * Double(totalValue)
        deliveryValue = calculateDelivery(distance: deliveryDistance)
        grandTotal = totalValue + Int(gstValue) + Int(deliveryValue)
        
    }
//    func updateCartItems(item: Cart){
//        let newCartItems = Cart(context: viewContext)
//        newCartItems.qauntity = String(Int(newCartItems.qauntity!)! + 1)
//    }
//    }
//    func updateCartItems(id: UUID, inc: Bool){
//        var ind: Int = 0
//        for i in 0..<cartItemss.count {
//            if(cartItemss[i].id == id){
//                ind = i
//                break
//            }
//        }
//        if inc{
//            cartItemss[ind].qauntity = String(Int(cartItemss[ind].qauntity!)! + 1)
////            cartItemss[ind].price = cartItemss[ind].itemVal * cartItemss[ind].price1
//        }else{
//            cartItemss[ind].qauntity = String(Int(cartItemss[ind].qauntity!)! - 1)
////            FoodItems[ind].itemVal -= 1
////            FoodItems[ind].price2 = FoodItems[ind].itemVal * FoodItems[ind].price1
//        }
//    }
    func deletecartItems(id: Int){
//        var ind: Int = 0
//        for i in 0..<FoodItems.count {
//            if(FoodItems[i].uniqueID == id){
//                ind = i
//                break
//            }
//        }
//        FoodItems.remove(at: ind)
//        updateTotal()
    }
    func updateTotal(){
//        var newtotalValue = 0
//        for i in 0..<FoodItems.count{
//            newtotalValue += FoodItems[i].price2
//        }
//        totalValue = (newtotalValue)
//        gstValue = 0.18 * Double(totalValue)
//        deliveryValue = calculateDelivery(distance: deliveryDistance)
//        grandTotal = totalValue + Int(gstValue) + Int(deliveryValue)
    }
    func calculateDelivery(distance: Int) -> Double{
        if distance <= 5{
            return 31.0
        }
        return 31.0 + Double((distance - 5)) * 25.0
        
    }
    func calculateTime(distance: Int) -> String{
        return "25-30 min"
    }
    

}

//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartView(hotel: <#hotelModel#>, tabSelected: .constant(0))
//    }
//}


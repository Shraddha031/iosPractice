//
//  DeliveryPage.swift
//  JustEatNew
//
//  Created by Shraddha on 28/02/23.
//

import SwiftUI


struct DeliveryPage: View {
    @State var temp: [hotelModel]
    @State var temp2: [DishModel]
    var restaurants: [hotelModel]
    @State private var serachDetails = ""
    @State private var showDetails: Bool = false
    @State private var isShowingSortSheet = false
    @State private var isShowingFilterSheet = false
    @State private var sortNumber = [false,false,false,false,false]
    @State private var sortSelected = 0
    @State private var vegSelected = false
    @State private var minCostVal = ""
    @State private var maxCostVal = ""
    @State private var categoryBool = [false,false,false,false,false,false]
    @State private var i = 0;
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "magnifyingglass").font(.title2).foregroundColor(Color("DarkShade"))
                TextField("Restaurant name or a dish...", text: $serachDetails).textInputAutocapitalization(.never).autocorrectionDisabled().onChange(of: serachDetails){ val in
                    temp = searchRestaurant(userSearh: val, data: restaurants)
                }
                Text("│").foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.793)).font(.title2)
                Image(systemName: "mic").font(.title3).foregroundColor(Color("DarkShade"))
            }.padding(10)
                .background(.white)
                .cornerRadius(12)
                .shadow(color:Color(hue: 1.0, saturation: 0.0, brightness: 0.88),radius:10)
                .padding(.horizontal).padding(.top).padding(.bottom, 4)
            HStack{
                Button(action: {
                    isShowingSortSheet = true
                }, label: {
                    Image(systemName: "slider.horizontal.3").font(.caption)
                    Text("Sort").font(.system(size: 16).weight(.semibold))
                    Text("▼").font(.caption)
                    
                }).padding(6).background(.white).cornerRadius(8).shadow(color:Color(hue: 1.0, saturation: 0.0, brightness: 0.88),radius:10)

                
                Button(action: {
                    isShowingFilterSheet = true
                }, label: {
                    Image(systemName: "loupe").font(.caption)
                    Text("Filter").font(.system(size: 16).weight(.semibold))
                    Text("").font(.caption)
                    
                }).padding(6).background(.white).cornerRadius(8).shadow(color:Color(hue: 1.0, saturation: 0.0, brightness: 0.88),radius:10)

            }.foregroundColor(Color("DarkShade"))
            List{
                ForEach(Array(temp.enumerated()), id: \.element.id) { index, data in
                    ZStack{
                        NavigationLink(destination: restaurantDetailPage(restaurant: temp2, hotel: data), label: {
                            EmptyView()
                        })
                        DeliveryCart(restaurant: data, dish: temp2[index%20]).listRowBackground(Color.clear)
                    }
                    
                }.listRowSeparator(.hidden)
            }.listStyle(.plain)
        }.padding(.top,47).overlay(CustomNavigation(title: "Delivery Page", firstBtnImage: "person.fill", secondBtnImage: "character.book.closed.fill", thirdBtnImage: "mappin.and.ellipse", showBackBtn: false)).padding(.bottom,4).sheet(isPresented: $isShowingSortSheet){
            sortView(sortSelected: $sortSelected , action: {
                isShowingSortSheet = false
                temp = sortRestaurants(sortType: sortSelected, data: temp)
                
            })
                .presentationDragIndicator(.visible)
        }.sheet(isPresented: $isShowingFilterSheet){
            filterView(toggleIsOn: $vegSelected,minValue: $minCostVal, maxValue: $maxCostVal, categoryBool: $categoryBool, action: {
                isShowingFilterSheet = false
                temp = searchRestaurant(userSearh:serachDetails, data: restaurants)
                print(temp.count)
            })
                .presentationDragIndicator(.visible)
        }
    }
    func searchRestaurant(userSearh: String,data: [hotelModel]) -> [hotelModel]{
        if userSearh.count == 0{
            return filterRestaurants(data: data)
        }
        let res = data.filter{ j in
            return j.name!.lowercased().contains(userSearh)
        }
        return filterRestaurants(data: res)
    }
    func sortRestaurants(sortType: Int, data: [hotelModel]) -> [hotelModel]{
        switch sortType{
        case 1:
            return data.sorted(by: {$0.rating!.count > $1.rating!.count})
        case 2:
            return data.sorted(by: {Int($0.distance!)! < Int($1.distance!)!})
        case 3:
            return data.sorted(by: {Int($0.distance!)! < Int($1.distance!)!})
        case 4:
            return data.sorted(by: {Int($0.price!)! < Int($1.price!)!})
        case 5:
            return data.sorted(by: {Int($0.price!)! > Int($1.price!)!})
        default:
            return restaurants
        }
    }
    func filterRestaurants(data: [hotelModel]) -> [hotelModel]{
        var values: [hotelModel] = []
        var categoryIsSelected = false
        for i in 0..<categoryBool.count{
            if categoryBool[i]{
                categoryIsSelected = true
                let res = data.filter{ j in
                    return j.category == "\(i+1)"
                }
                values += res
            }
        }
        if values.count == 0 && !categoryIsSelected{
            values = data
        }
        if vegSelected {
            let res = values.filter{i in
                return i.isVeg!
            }
            values = res
        }
        if minCostVal != ""{
            let res = values.filter{ i in
                return Int(i.price!)! >= Int(minCostVal) ?? 0
            }
            values = res
        }
        if maxCostVal != ""{
            let res = values.filter{i in
                return Int(i.price!)! <= Int(maxCostVal) ?? 1000
            }
            values = res
        }
        return sortSelected != 0 ? sortRestaurants(sortType: sortSelected, data: values) : values
    }
}

//struct DeliveryPage_Previews: PreviewProvider {
//    static var previews: some View {
//        DeliveryPage(temp: <#[hotelModel]#>)
//    }
//}

//return j.name!.lowercased().contains(userSearh)

//@State private var restaurantsDetails = [
//    Restaurant(restaurantName: "Mom's Pizza", dishes: [Dish(name: "Pizza", image: "restaurant1", price: 500, ratings: 4.3, description: "Combination of cottage cheese and exotic gravy made from tomato puree, chopped onions, cashew nuts and spices", isVeg: true, totalVotes: 123), Dish(name: "Pizza", image: "restaurant1", price: 500, ratings: 4.3, description: "Combination of cottage cheese and exotic gravy made from tomato puree, chopped onions, cashew nuts and spices", isVeg: true, totalVotes: 123), Dish(name: "Pizza", image: "restaurant1", price: 500, ratings: 4.3, description: "Combination of cottage cheese and exotic gravy made from tomato puree, chopped onions, cashew nuts and spices", isVeg: true, totalVotes: 123)], liked: true, category: ["Pizza", "Buger", "Taco"], distance: 4, ratings: 4.6),
//    Restaurant(restaurantName: "Sagar Ratna", dishes: [Dish(name: "Dosa", image: "dosa", price: 325, ratings: 4.3, description: "Combination of cottage cheese and exotic gravy made from tomato puree, chopped onions, cashew nuts and spices", isVeg: true, totalVotes: 786)], liked: true, category: ["Dosa", "Vada", "Idli"], distance: 4, ratings: 4.6),
//    Restaurant(restaurantName: "Mom's Pizza", dishes: [Dish(name: "Pizza", image: "restaurant1", price: 500, ratings: 4.3, description: "Combination of cottage cheese and exotic gravy made from tomato puree, chopped onions, cashew nuts and spices", isVeg: true, totalVotes: 156)], liked: true, category: ["Pizza", "Buger", "Taco"], distance: 4, ratings: 4.6)
//
//
//]

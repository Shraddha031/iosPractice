//
//  DeliveryCart.swift
//  JustEatNew
//
//  Created by Shraddha on 02/03/23.
//

import SwiftUI

struct DeliveryCart: View {
    @State private var liked = false
    @State private var boxHeight = UIScreen.main.bounds.height*0.3
    @State private var boxWidth = UIScreen.main.bounds.width
    var restaurant: hotelModel
    var dish: DishModel
    var body: some View {
        ZStack{
            VStack{
                ZStack {
                    AsyncImage(url: URL(string: dish.image!)) { image in
                        image.resizable()
                    } placeholder: {
                        Image("dosa").resizable().scaledToFill().frame(height: boxHeight*0.8).cornerRadius(20, corners: [.topLeft, .topRight])
                    }
                    .scaledToFill().frame(height: boxHeight*0.8).cornerRadius(20, corners: [.topLeft, .topRight])
                .clipped()
                    Color.black.opacity(0.18)
                }
                Spacer()
                HStack {
                    Image("Timer").resizable().scaledToFit().frame(width: 20, height: 20)
                    Text("\(getEstimatedTime(restaurant.distance!)) ◦ \(restaurant.distance!) km")
                    Spacer()
                    Text("₹ \(restaurant.price!) for one")
                }.padding(6).font(.subheadline).fontWeight(.medium)
                Spacer()
                
            }
            VStack {
                HStack{
                    Text("\(dish.name!) ◦ ₹\(dish.price!)").padding(6)
                        .font(.caption).fontWeight(.semibold).foregroundColor(.white).background(Color.black.opacity(0.7)).overlay(RoundedRectangle(cornerRadius: 4).stroke(Color("darkGray"),lineWidth: 3)).cornerRadius(8)
                    Spacer()
                        Button(action: {
                            liked.toggle()
                        }, label: {
                            if liked{
                                Image(systemName: "suit.heart.fill").font(.title2).foregroundColor(.red)
                            }else{
                                Image(systemName: "suit.heart").font(.title2).foregroundColor(Color("lightestGray"))
                            }
                        })
                
                }.padding()
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(restaurant.name!)")
                            .font(.title.weight(.heavy)).foregroundColor(.white).lineLimit(1)
                        Text(getCategory(restaurant.category!))
                            .font(.subheadline).foregroundColor(.white)
                    }
                    HStack{
                        Spacer()
                        VStack{
                            HStack {
                                Text("\(restaurant.rating!)").font(.subheadline.weight(.bold)).padding(.leading, 4)
//                                Image(systemName: "star.fill").font(.footnote)
                            }.padding(.vertical,2)
                        }.padding(2.5).background(Color(hue: 0.302, saturation: 0.886, brightness: 0.448)).foregroundColor(.white).cornerRadius(5)
                    }
                }.padding(.horizontal).padding(.top, 30)
                Spacer()
            }
        }.frame(width: UIScreen.main.bounds.width - 20,height: UIScreen.main.bounds.height * 0.3).background(.white).overlay {
            RoundedRectangle(cornerRadius: 20, style: .continuous).stroke( Color("lightGray"),lineWidth: 1)
        }.background(.white).cornerRadius(20).shadow(radius:8, x:4, y:4)
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

struct DeliveryCart_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryCart(restaurant: hotelModel(data: ["D": true,
                                                   "F": "3",
                                                   "G": "400",
                                                   "H": false,
                                                   "I": "Round Rock, Texas, United States",
                                                   "col1": "3",
                                                   "fullName": "La Pino's Pizza",
                                                   "id" : 50,
                                                   "rating": "\u{2b50}\u{fe0f}\u{2b50}\u{fe0f}\u{2b50}\u{fe0f}"
                                                  ]), dish: DishModel(data: ["D":"Cake",
                                                                             "E":"250",
                                                                             "G":"https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.bakingo.com%2Fp%2Fcake%2Fchoco-vanilla-cake0006chva&psig=AOvVaw1VhPG9RDvZQUAvXKMX7T3E&ust=1678262654733000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCKiJrt2tyf0CFQAAAAAdAAAAABAG",
                                                                             "col1":"\u{2b50}\u{fe0f}\u{2b50}\u{fe0f}",
                                                                             "col2":"Chocolate, Truffle, Vanilla, Butterscotch, Black Forest, Red Velvet Birthday Cakes & More",
                                                                             "col3":"875",
                                                                             "id": 8,
                                                                             "isUser":true]))
    }
}


//
//  RestaurantModel.swift
//  JustEatNew
//
//  Created by Shraddha on 02/03/23.
//

import Foundation

struct Restaurant{
    var uniqueID = UUID()
    var restaurantName:String
    var dishes: [Dish]
    var liked: Bool
    var category: [String]
    var distance: Double
    var ratings: Double
    func getEstimatedTime() -> String{
        let time = 15 + Int(distance * 4)
        return ("\(time) - \(time+5) min")
    }
}
struct Dish{
    var uniqueID = UUID()
    var name: String
    var image: String
    var price: Int
    var ratings: Double
    var description: String
    var isVeg: Bool
    var totalVotes: Int
}

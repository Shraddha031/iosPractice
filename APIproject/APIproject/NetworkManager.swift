//
//  NetworkManager.swift
//  APIproject
//
//  Created by Shraddha on 01/02/23.
//

import Foundation
import UIKit

//class NetworkManager{
//    static let shared = NetworkManager()
//
//    func requestForAPI(endpoint: ApisEndPoint,completionHandler: ((Any)->())?) {
//        var request = URLRequest(url: URL(string: kBaseUrl + endpoint.rawValue)!)
//        request.httpMethod = "GET"
//        request.setValue("application/json", forHTTPHeaderField:  "Accept")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        let session = URLSession.shared
//        session.dataTask(with: request) {data,  response, err in
//            if let err = err {
//                print("Recieved some error in api \(err.localizedDescription)")
//                return
//            }
//            guard let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) else {
//                print("Getting some error on json serialization")
//                return
//            }
//            print(jsonData)
//            completionHandler?(jsonData)
//            print("Entered the completionHandler")
//
//        }.resume()
//    }
//}
//
//enum ApisEndPoint: String {
//    case customers = "Customers"
//    case orders = "Orders"
//    case products = "Products"
//    case invoices = "Invoices"
//}
//
//let kBaseUrl = "https://services.odata.org/V3/Northwind/Northwind.svc/"


class NetworkManager{
    static let shared = NetworkManager()

    func requestForAPI(completionHandler: ((Any)->())?) {
        var request = URLRequest(url: URL(string: kBaseUrl + ApisVar + apiKey)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField:  "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request) {data,  response, err in
            if let err = err {
                print("Recieved some error in api \(err.localizedDescription)")
                return
            }
            guard let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) else {
                print("Getting some error on json serialization")
                return
            }
            print(jsonData)
            completionHandler?(jsonData)
            print("Entered the completionHandler")

        }.resume()
    }
}
var ApisVar = "/movie/popular?"
let apiKey = "api_key=314778b919b218a848acfcee10a6c785"


let kBaseUrl = "https://api.themoviedb.org/3"


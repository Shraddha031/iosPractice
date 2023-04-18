//
//  NetworkManager.swift
//  JustEatNew
//
//  Created by Shraddha on 07/03/23.
//

import Foundation
import UIKit
class NetworkManager {
    static let shared = NetworkManager()
 /// func for request for api
    func requestForApi(urlString: String,completionHandler: ((Any)->())?) {
        var request = URLRequest(url: URL(string: urlString)!)
//        if(urlString == "https://retoolapi.dev/5DddMe/data"){
//            request.fetchli
//        }
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request) {data, response, err in
            if let err = err {
                print("Received some error in api \(err.localizedDescription)")
                return
            }
            guard let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) else {
                print("Getting some error on json Sericliaxation")
                return
            }
            print(jsonData)
            completionHandler?(jsonData)
            print("Entered the completionHandler")
        }.resume()
    }
}

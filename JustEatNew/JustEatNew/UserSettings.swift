//
//  UserSettings.swift
//  JustEatNew
//
//  Created by Shraddha on 28/02/23.
//

import Foundation

class UserSettings: ObservableObject{
    @Published var loggedIn = false
    @Published var user = User()
    @Published var refreshId = UUID()
    func signIn(){
        loggedIn = true
    }
    func signOut(){
        loggedIn = false
    }
    func setUser(user: User){
        self.user = user
    }
    func setCartItems(items: [Cart]){
        self.user.cartItem?.addingObjects(from: items)
    }
    func refreshCart() {
        refreshId = UUID()
    }

}

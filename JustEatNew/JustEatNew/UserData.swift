//
//  UserData.swift
//  JustEatNew
//
//  Created by Shraddha on 15/03/23.
//

import Foundation

class UserData: ObservableObject{
    @Published var user: User
    
    init(_ user: User) {
        self.user = user
    }
}

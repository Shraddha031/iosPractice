//
//  GroceyList.swift
//  JustEatNew
//
//  Created by Shraddha on 22/02/23.
//

import SwiftUI

struct GroceryList: View {
    var image1: String = ""
    var line0: String = ""
    var line1:String = ""
    init(_ image1: String, _ line0: String,_ line1: String){
        self.image1 = image1
        self.line0 = line0
        self.line1 = line1
    }
    var body: some View {
        HStack{
            Image(image1).resizable().scaledToFit().frame(width: 60, height: 60).background(Color("LightBackground")).cornerRadius(50)
            VStack{
                HStack{
                    Text(line0).font(.system(size: 18))
                        .fontWeight(.semibold)
                        .frame(alignment: .leading)
                    Spacer()
                }
                HStack{
                    Text(line1).font(.system(size: 18))
                        .fontWeight(.semibold)
                        .frame(alignment: .leading)
                    Spacer()
                }
                
            }
            
        }.padding(8).frame(width: UIScreen.main.bounds.width - 40).overlay {
            RoundedRectangle(cornerRadius: 25, style: .continuous).stroke( Color("lightGray"),lineWidth: 1)
        }
    }
//    func abkch() {
//        NavigationLink("", destination: ProfilePage(userLoggedIn: $logOutIsActive), isActive: $profileIsActive)
//    }
}

struct GroceryList_Previews: PreviewProvider {
    static var previews: some View {
        GroceryList("", "m", "m")
    }
}


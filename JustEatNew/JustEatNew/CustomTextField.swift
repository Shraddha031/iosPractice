//
//  CustomTextField.swift
//  JustEatNew
//
//  Created by Shraddha on 15/02/23.
//

import SwiftUI

struct CustomTextField: View {
    var tfName: String?
    @State private var tfData: String = ""
    @State private var labelIsActive = false
    @State private var pswdIsActive = false
    @State private var borderColor = Color(.gray)
    var pswdField: Bool?
     @Binding var showError: Bool = false
    
    static var func1: ((String, String)->Void)?
    var body: some View {
        ZStack{
            if pswdField ?? false {
                SecureField(tfName ?? "Password", text: $tfData, onCommit: {pswdIsActive = false})
                    .onChange(of: tfData){ data in
                    showError = false
                    CustomTextField.func1?(data,tfName!)
                    }.onTapGesture {
                        pswdIsActive = true
                    }
                    .padding().overlay {
                        RoundedRectangle(cornerRadius: 10, style: .continuous).stroke( borderColor,lineWidth: 2)
                }
                if pswdIsActive{
                    HStack{
                        Text(tfName ?? "Email").font(.system(size: 14)).background(.white)
                        Spacer()

                    }.padding(.bottom, 50).padding(.leading, 20)
                }
            } else {
                TextField(tfName ?? "Email", text: $tfData){i in
                    if i{
                        labelIsActive = true
//                        borderColor = (showError) ? Color(.red): Color("BlueShade")
    //                    CustomTextField.func1?(tfData,tfName!)
                }
                    else{
                        labelIsActive = false
                        borderColor = (showError) ? Color(.gray):Color(.red)
    //                    CustomTextField.func1?(tfData,tfName!)
                    }
                }.onChange(of: tfData){ data in
                    CustomTextField.func1?(data,tfName!)
                    borderColor = Color("BlueShade")
                    
                    
                }.onTapGesture {
                    pswdIsActive = false
                }.onSubmit {
                    borderColor = (showError) ? Color(.gray) : Color(.red)
                    print("error is \(showError)")
                }
                .padding().overlay {
                        RoundedRectangle(cornerRadius: 10, style: .continuous).stroke( borderColor,lineWidth: 2)
                    }
            }
            
            if labelIsActive{
                HStack{
                    Text(tfName ?? "Email").font(.system(size: 14)).background(.white)
                    Spacer()

                }.padding(.bottom, 50).padding(.leading, 20)
            }
        }.frame(alignment: .leading).onAppear(){
            borderColor = (showError) ? Color(.gray) : Color(.red)
            print("error is \(showError)")
        }
    }
}

//struct CustomTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTextField()
//    }
//}

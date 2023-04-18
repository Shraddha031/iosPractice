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
    @FocusState var labelIsActive
    @State private var pswdIsActive = false
    @State private var borderColor = Color(.gray)
    private var title: String = ""
    @Binding private var text: String
    init(_ title: String, text: Binding<String>, showError: Binding<Bool>) {
        self.title = title
        self._text = text
        self._showError = showError
    }


    var pswdField: Bool?
     @Binding var showError: Bool
    
    var body: some View {
        ZStack{
            TextField(title, text: $text) { i in
                if i {
                    borderColor = (showError) ? Color(.red):Color("BlueShade")
                }
                else{
                    borderColor = (showError) ? Color(.red):Color(.gray)
                }
            }
            .onChange(of: text){ data in
                showError = false
                borderColor = (showError) ? Color(.red):Color("BlueShade")
                
            }.onTapGesture {
                showError = false
                pswdIsActive = false
            }.onSubmit {
                borderColor = (showError) ? Color(.red) : Color(.gray)
                print("error is \(showError)")
            }.focused($labelIsActive)
            .padding().overlay {
                RoundedRectangle(cornerRadius: 10, style: .continuous).stroke( borderColor,lineWidth: 2)
            }
        
            if labelIsActive{
                HStack{
                    Text(title).font(.system(size: 14)).background(.white)
                    Spacer()

                }.padding(.bottom, 50).padding(.leading, 20).onAppear{
                    borderColor = (showError) ? Color(.red) : Color("BlueShade")
                }.onDisappear{
                    borderColor = showError ? Color(.red) : Color(.gray)
                }
            }
        }.frame(alignment: .leading).onAppear(){
            borderColor = (showError) ? Color(.red) : Color(.gray)
            print("error is \(showError)")
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField("", text:.constant(""), showError: .constant(false))
    }
}

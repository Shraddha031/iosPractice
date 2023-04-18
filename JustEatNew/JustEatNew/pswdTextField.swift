//
//  pswdTextField.swift
//  JustEatNew
//
//  Created by Shraddha on 20/02/23.
//

import SwiftUI

//struct pswdTextField: View {
//
//    @Binding private var text: String
//    @State private var isSecured: Bool = true
//    @State private var borderColor = Color(.gray)
//    private var title: String
//    @Binding var showError: Bool
//
//    init(_ title: String, text: Binding<String>, showError: Binding<Bool>) {
//        self.title = title
//        self._text = text
//        self._showError = showError
//    }
//
//    var body: some View {
//        ZStack(alignment: .trailing) {
//            Group {
//                if isSecured {
//                    SecureField(title, text: $text).padding().overlay {
//                        RoundedRectangle(cornerRadius: 10, style: .continuous).stroke( borderColor,lineWidth: 2)
//                    }.onSubmit {
//                        borderColor = (showError) ? Color(.gray) : Color(.red)
//                        print("error is \(showError)")
//                    }
//                } else {
//                    CustomTextField(tfName: title, showError: $showError)
//                }
//            }
//            Button(action: {
//                isSecured.toggle()
//            }) {
//                Image(systemName: self.isSecured ? "eye.slash" : "eye")
//                    .accentColor(.gray)
//            }.padding()
//        }
//    }
//}
struct pswdTextField: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    @State private var borderColor = Color(.gray)
    @FocusState private var labelIsActive
    private var title: String
    @Binding var showError: Bool
    

    
    init(_ title: String, text: Binding<String>, showError: Binding<Bool>) {
        self.title = title
        self._text = text
        self._showError = showError
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                ZStack {
                    if isSecured {
                        SecureField(title, text: $text).onChange(of: text){ data in
                            showError = false
                            borderColor = showError ? Color(.red) : Color("BlueShade")
                        }.onTapGesture {
                            showError = false
                            borderColor = Color("BlueShade")
                        }.onSubmit {
                            print("password \(showError)")
                            borderColor = (showError) ? Color(.red) : Color(.gray)
                        }
                            .focused($labelIsActive)
                            .padding()
                            .overlay {
                            RoundedRectangle(cornerRadius: 10, style: .continuous).stroke( borderColor,lineWidth: 2)
                        }
                    } else {
                        TextField(title, text: $text){i in
                            if i{
//                                borderColor=Color("BlueShade")
                            borderColor = (showError) ? Color(.red):Color("BlueShade")
//                            CustomTextField.func1?(tfData,tfName!)
                            }
                            else{
//                                labelIsActive = false
                                borderColor = (showError) ? Color(.red):Color(.gray)
                                //                    CustomTextField.func1?(tfData,tfName!)
                            }
                        }.onChange(of: text){ data in
                            showError = false
                            borderColor = showError ? Color(.red): Color("BlueShade")
                        }.onTapGesture {
                            showError = false
//                            labelIsActive = false
                        }.onSubmit {
                            print("password \(showError)")
                            borderColor = (showError) ? Color(.red) : Color(.gray)
                        }
                            .focused($labelIsActive)
                            .padding()
                            .overlay {
                            RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(borderColor,lineWidth: 2)
                        }
                    }
                    
                    if labelIsActive {
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

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }
    }
}

struct pswdTextField_Previews: PreviewProvider {
    static var previews: some View {
        pswdTextField("hi", text: .constant("hey"), showError: .constant(false))
    }
}

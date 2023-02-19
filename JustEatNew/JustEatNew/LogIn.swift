//
//  LogIn.swift
//  JustEatNew
//
//  Created by Shraddha on 16/02/23.
//

import SwiftUI

struct LogIn: View {
    @State private var emailCorrect: Bool?
    @State private var pswdCorrect: Bool?
    @State private var email:String = ""
    @State private var emailShowError: Bool = true
    @State private var passwordShowError: Bool = true
    @State private var emailLogTf: String = ""
    @State private var passwordLogTf: String = ""
    @FocusState var isEmailFocused: Bool
    var body: some View {
        VStack{
            Image("Veggie").resizable().scaledToFill().frame(height:200).padding(.vertical,20)
            CustomTextField(tfName: "Email & Phone", showError: $emailShowError).focused($isEmailFocused).onSubmit {
                print("we got result\(isValidEmail(emailLogTf))")
                emailShowError = isValidEmail(emailLogTf)
                print(emailShowError)
            } 
            CustomTextField(tfName: "Password", showError: $passwordShowError)
        PrimaryButton(btnTitle: "Sign In") {
//            emailShowError = true
//            if isEmailFocused{
//                emailShowError = false
//            }else{
//                emailShowError = true
//            }
        }
            
        }.padding(16).onAppear(){
            CustomTextField.func1 = { data, type in
                switch type{
                case "Email & Phone":
                    emailLogTf = data
                case "Password":
                    passwordLogTf = data
                default:
                    print("Hi: \(data)")
                }
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        print("email is \(email)")
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
 

//
//  SignUp.swift
//  JustEatNew
//
//  Created by Shraddha on 15/02/23.
//

import SwiftUI

struct SignUp: View {
    @State private var emailTf: String = ""
    @State private var fullNameTf: String = ""
    @State private var birthdayTf: String = ""
    @State private var passwordTf: String = ""
    @State private var emailLableValue = false
    @State private var emailShowError: Bool = true
    @State private var passwordShowError: Bool = true
    @State private var nameShowError: Bool = true
    @State private var birthdayShowError: Bool = true
    @State private var tapCount = UserDefaults.standard.value(forKey: "Tap")
    @State private var loginIsActive = false
    var showError: Bool? = false
    
    @Environment(\.presentationMode) var presentation
    var body: some View {
        
//        NavigationView {
            VStack{
                Image("Veggie").resizable().scaledToFill().frame(height: 180).padding(36)
                CustomTextField(tfName: "Email & Phone", showError: $emailShowError).onSubmit {
                    print("we got result\(isValidEmail(emailTf))")
                    emailShowError = isValidEmail(emailTf)
                    print(emailShowError)
                }
.padding(.bottom, 10)
                CustomTextField(tfName: "Full Name", showError: $nameShowError).padding(.bottom, 10)
                CustomTextField(tfName: "Birthday", showError: $birthdayShowError).padding(.bottom, 10)
                CustomTextField(tfName: "Password", pswdField: true, showError: $passwordShowError).onSubmit {
                    print("we got result\(isValidPassword(passwordTf))")
                    passwordShowError = isValidPassword(passwordTf)
                    print(passwordShowError)
                }

                
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        print("email is \(email)")
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func isValidPassword(_ email: String) -> Bool {
        let emailRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        print("email is \(email)")
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

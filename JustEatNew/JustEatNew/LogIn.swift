//
//  LogIn.swift
//  JustEatNew
//
//  Created by Shraddha on 16/02/23.
//

import SwiftUI
struct LogIn: View {
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    @EnvironmentObject var userSetting: UserSettings
    @State private var emailCorrect: Bool?
    @State private var pswdCorrect: Bool?
    @State private var email:String = ""
    @State private var emailShowError: Bool = false
    @State private var passwordShowError: Bool = false
    @State private var emailLogTf: String = ""
    @State  var passwordLogTf: String = ""
    @FocusState var isEmailFocused: Bool
    @FocusState var isPasswordFocused: Bool
//    @Binding var userLoggedIn:Bool
    @State private var showAlert = false
    @State private var showAlertMsg = "Logged In Successfully"
    var body: some View {
        VStack{
            Spacer()
            Image("Veggie").resizable().scaledToFit().frame(height: 180).padding(.bottom,10)
            CustomTextField("Email & Phone",text: $emailLogTf, showError: $emailShowError).padding(.bottom, 10).focused($isEmailFocused).onSubmit {
                print("we got result\(isValidEmail(emailLogTf))")
                emailShowError = !isValidEmail(emailLogTf)
                isEmailFocused.toggle()
                print(emailShowError)
            }.autocorrectionDisabled(true)
            pswdTextField("Enter your password", text: $passwordLogTf, showError: $passwordShowError).padding(.bottom, 30).focused($isPasswordFocused)
                .onSubmit {
                    passwordShowError = !isValidPassword(passwordLogTf)
                    isPasswordFocused.toggle()
                }
        PrimaryButton(btnTitle: "Sign In") {
//            isEmailFocused.toggle()
            if authenticateUser(email: emailLogTf , pswd: passwordLogTf){
                UserDefaults.standard.set(true, forKey: "loggedIn")
//                userLoggedIn = true
                userSetting.signIn()
            }else{
                showAlertMsg = "Invalid Credentials"
                showAlert = true
            }
            isPasswordFocused.toggle()
        }.alert(showAlertMsg, isPresented: $showAlert){
            Button("OK", role: .cancel){}
        }
        Spacer()
        }.padding(32)
         
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        print("email is \(email)")
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func authenticateUser(email: String, pswd: String) -> Bool {
        for user in users{
            if email == user.email! && pswd == user.password!{
                UserDefaults.standard.set(user.name, forKey: "userName")
                UserDefaults.standard.set(user.email, forKey: "userEmail")
                UserDefaults.standard.set(user.dob, forKey: "userDob")
                return true
            }
        }
        return false
    }
    func isValidPassword(_ email: String) -> Bool {
        let emailRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
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
 

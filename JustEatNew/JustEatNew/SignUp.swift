//
//  SignUp.swift
//  JustEatNew
//
//  Created by Shraddha on 15/02/23.
//

import SwiftUI

struct SignUp: View {
    @Environment(\.managedObjectContext) var viewContext
    @State private var emailTf: String = ""
    @State private var fullNameTf: String = ""
    @State private var birthdayTf: String = ""
    @State private var passwordTf: String = ""
    @State private var emailLableValue = false
    @State private var emailShowError: Bool = false
    @State private var passwordShowError: Bool = false
    @State private var nameShowError: Bool = false
    @State private var birthdayShowError: Bool = false
    @State private var tapCount = UserDefaults.standard.value(forKey: "Tap")
    @State private var loginIsActive = false
    @FocusState var isEmailSFocused:Bool
    @FocusState var isNameSFocused:Bool
    @FocusState var isBirthdaySFocused:Bool
    @FocusState var isPasswordSFocused:Bool
    @State private var ddBirthdayTf: String = ""
    @State private var mmBirthdayTf: String = ""
    @State private var yyBirthdayTf: String = ""
    @State private var showAlert = false
    var showError: Bool? = true
    
    
    @Environment(\.presentationMode) var presentation
    var body: some View {
            VStack{
                Image("Veggie").resizable().scaledToFit().frame(height: 180).padding(.bottom,10)
                CustomTextField("Email & Phone",text: $emailTf, showError: $emailShowError).focused($isEmailSFocused).padding(.bottom,5).onSubmit {
                    print("we got result\(isValidEmail(emailTf))")
                    emailShowError = !isValidEmail(emailTf)
                    isNameSFocused.toggle()
                    print(emailShowError)
                }.autocorrectionDisabled(true)
                CustomTextField("Full Name",text: $fullNameTf, showError: $nameShowError).focused($isNameSFocused).padding(.bottom,5).onSubmit {
                    nameShowError = !isValidName(fullNameTf)
                    isBirthdaySFocused.toggle()
                }.autocorrectionDisabled(true)
                CustomeDateField(ddTF: $ddBirthdayTf, mmTF: $mmBirthdayTf, yyTF: $yyBirthdayTf, showError: $birthdayShowError).focused($isBirthdaySFocused).padding(.bottom,12).onSubmit {
                    birthdayShowError = !isValidDate(ddBirthdayTf, mmBirthdayTf, yyBirthdayTf)
                    isPasswordSFocused.toggle()
                }
                pswdTextField("Enter your password", text: $passwordTf, showError: $passwordShowError).focused($isPasswordSFocused).onSubmit {
                    print("we got result\(isValidPassword(passwordTf))")
                    passwordShowError = !isValidPassword(passwordTf)
                    isPasswordSFocused.toggle()
                    print("pass signup \(passwordShowError)")
                }
                    PrimaryButton(btnTitle: "Sign Up") {
                        nameShowError = !isValidName(fullNameTf)
//                        isNameSFocused.toggle()
//                        emailShowError = !isValidEmail(emailTf)
//                        isEmailSFocused.toggle()
//                        passwordShowError = !isValidPassword(passwordTf)
//                        isPasswordSFocused.toggle()
//                        self.presentation.wrappedValue.dismiss()
                        if isValidEmail(emailTf){
                            if isValidName(fullNameTf){
                                if isValidDate(ddBirthdayTf, mmBirthdayTf, yyBirthdayTf){
                                    if isValidPassword(passwordTf){
                                        UserDefaults.standard.set(emailTf, forKey: "userEmail")
                                        UserDefaults.standard.set(passwordTf, forKey: "userPswd")
                                        UserDefaults.standard.set(fullNameTf, forKey: "userName")
                                        UserDefaults.standard.set(ddBirthdayTf + mmBirthdayTf + yyBirthdayTf, forKey: "userDOB")
                                        let user = User(context: viewContext)
                                        user.email = emailTf
                                        user.name = fullNameTf
                                        user.password = passwordTf
                                        user.dob = birthdayTf
                                        try? viewContext.save()
                                        showAlert = true
                                    }else{
                                        passwordShowError = true
                                        isPasswordSFocused.toggle()
                                    }
                                }else{
                                    birthdayShowError = true
                                    isBirthdaySFocused.toggle()
                                }
                            }else{
                                nameShowError = true
                                isNameSFocused.toggle()
                            }
                        }else{
                            emailShowError = true
                            isEmailSFocused.toggle()
                        }
               

                    }.padding(.vertical,10).alert("Signed Up Successfully", isPresented: $showAlert){
                        Button("OK", role: .cancel){
                            self.presentation.wrappedValue.dismiss()
                        }
                    }
                
                HStack{
                    Text("Already Have An account?")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.04, brightness: 0.489))
                    Button("Log In"){
                        
                    }.tint(Color("BlueShade")).bold()
                }
                
            }.padding(32)
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
    func isValidName(_ email: String) -> Bool {
        if email.count < 3{
            return false
        }
        return true
    }
    func isValidDate(_ dd:String, _ mm: String, _ yy: String) ->Bool{
        guard let dd = Int(dd) else{return false}
        guard let mm = Int(mm) else{return false}
        guard let yy = Int(yy) else{return false}
        var m = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        if yy%4 == 0{
            if !(yy % 100 == 0 && yy % 400 != 0){
                m[1] = 29
            }
        }
        if yy>2023{
            return false
        }
        if dd < 1 || dd > m[mm-1]{
            return false
        }
        return true
    }
    

}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

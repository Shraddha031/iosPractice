//
//  SignUpVc.swift
//  JustEat
//
//  Created by Shraddha on 07/02/23.
//

import UIKit

class SignUpVc: UIViewController, UITextFieldDelegate {
    let justEatBlue = UIColor(named: "blueShade")
    let justEatGray = UIColor(named: "justEatGrey")
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var upperCon: NSLayoutConstraint!
    @IBOutlet weak var textFieldLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        birthdayTextField.delegate = self
        nameTextField.delegate = self
        emailTextField.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Beginnnn")
        textField.layer.borderWidth = 2.0
        textField.layer.cornerRadius = 10.0
        if textField == passwordTextField {
            setUpUpperConstraint(margin:240, text: "Password")
            passwordTextField.layer.borderColor = justEatBlue?.cgColor
            birthdayTextField.layer.borderColor = justEatGray?.cgColor
            nameTextField.layer.borderColor = justEatGray?.cgColor
            emailTextField.layer.borderColor = justEatGray?.cgColor
        } else if textField == birthdayTextField {
            setUpUpperConstraint(margin:164, text: "Birthday")
            birthdayTextField.layer.borderColor = justEatBlue?.cgColor
            nameTextField.layer.borderColor = justEatGray?.cgColor
            emailTextField.layer.borderColor = justEatGray?.cgColor
            passwordTextField.layer.borderColor = justEatGray?.cgColor
            
        }else if textField == nameTextField{
            setUpUpperConstraint(margin:88, text: "Full Name")
            nameTextField.layer.borderColor = justEatBlue?.cgColor
            emailTextField.layer.borderColor = justEatGray?.cgColor
            passwordTextField.layer.borderColor = justEatGray?.cgColor
            birthdayTextField.layer.borderColor = justEatGray?.cgColor
        }else if textField == emailTextField{
            setUpUpperConstraint(margin:12, text: "Email or Phone")
            emailTextField.layer.borderColor = justEatBlue?.cgColor
            passwordTextField.layer.borderColor = justEatGray?.cgColor
            birthdayTextField.layer.borderColor = justEatGray?.cgColor
            nameTextField.layer.borderColor = justEatGray?.cgColor
        }
    }
    func setUpUpperConstraint(margin:Int, text:String){
        upperCon.constant = CGFloat(margin)
        textFieldLabel.text = text
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

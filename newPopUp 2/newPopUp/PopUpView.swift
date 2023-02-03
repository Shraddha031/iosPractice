//
//  PopUpView.swift
//  newPopUp
//
//  Created by Shraddha on 30/01/23.
//

import Foundation
import UIKit
enum AlertType {
    case singleButton
    case doubleButton
}
enum PopupButtonTap {
    case primary
    case secondary
}

//enum ClickedButton {
//    case first
//    case second
//}

class PopUpView: UIView {
    
    static var popupAction: ((PopupButtonTap)-> Void)?
    
    @IBOutlet var parentView: UIView!
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupHead: UILabel!
    @IBOutlet weak var secondaryButton: UIButton!
    @IBOutlet weak var primaryButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("PopUpView", owner: self, options: nil)
        customUI()
//        initSubview()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        initSubview()
    }
    func customUI(){
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        primaryButton.addTarget(self, action: #selector(primaryButtonAction), for: .touchUpInside)
    }
    
    func showAlert(title: String, description: String,type: AlertType, caller: SharedPreference.ClickedButton){
        descriptionLabel.text = description
        popupHead.text = title
        switch type {
            case .singleButton:
                primaryButton.isHidden = true
            case .doubleButton:
                primaryButton.isHidden = false
                
        }
        let keyWindow = UIApplication.shared.windows.first
        print(parentView)
        keyWindow?.addSubview(parentView)
        SharedPreference.shared.callingVC = caller
    }
    func method1(s1: Int, s2: Int) -> Int {
        return s1+s2
        
    }
    
    var myClosure: (Int, Int) -> Int = {
        (number1,number2) in
            return number1+number2
    }
//    @objc func primaryButtonAction(){
//        print("primary ")
//    }
    @IBAction func secondaryButtonAction(_ sender: UIButton) {
        print(parentView)
        parentView.removeFromSuperview()
        PopUpView.popupAction?(.secondary)
    }
    
    @IBAction func primaryButtonAction(_ sender: Any?) {
//        print("primary")
        PopUpView.popupAction?(.primary)
    }
}

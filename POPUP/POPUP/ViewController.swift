//
//  ViewController.swift
//  POPUP
//
//  Created by Shraddha on 27/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btnAction(_ sender: UIButton) {
//        let temp = PoupViewController()
//        temp.appear(sender: self)
        let a = PopupView()
        a.showAlert()
            }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let popupView = PoupViewController()
//        self.present(popupView, animated: true)
//
//        view.addSubview(popupView)
        
    }


}


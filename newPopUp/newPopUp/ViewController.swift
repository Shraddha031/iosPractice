//
//  ViewController.swift
//  newPopUp
//
//  Created by Shraddha on 30/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAction(_ sender: UIButton) {
        let temp = PopUpView()
        temp.showAlert(title: "hii", description: "ios", type: .doubleButton, sender: self)
        
    }
    
}


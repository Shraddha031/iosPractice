//
//  ViewController.swift
//  CustomDesign
//
//  Created by Shraddha on 24/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: CustomButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.setTitleColor(.green, for: .normal)
//        btn.tintColor = .green
        // Do any additional setup after loading the view.
    }


}


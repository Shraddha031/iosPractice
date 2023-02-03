//
//  ViewController.swift
//  CustomDesign
//
//  Created by Shraddha on 24/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swtch: UISwitch!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var sliderVal: UILabel!
    @IBOutlet weak var btn: CustomButton!
    @IBOutlet weak var sliderLeftConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.setTitleColor(.green, for: .normal)
        mySlider.transform = CGAffineTransform(rotationAngle: .pi/2)
        sliderLeftConstraint.constant = -(mySlider.frame.size.height / 2)
        

//        btn.tintColor = .green
        // Do any additional setup after loading the view.
    }
    


    @IBAction func sliderValueChanged(_ sender: UISlider) {
        var temp=(sender.value)
        sliderVal.text="\(temp)"
//        sliderVal.layer.
        
    }
}













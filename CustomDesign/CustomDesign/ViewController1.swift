//
//  ViewController1.swift
//  CustomDesign
//
//  Created by Shraddha on 25/01/23.
//

import UIKit

class ViewController1: UIViewController {
    

    var arr: [Int] = [0,20,40,60,80,100]
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var yourSlider: UISlider!
//
//    @IBAction func updateSlider(_ sender: UISlider) {
//        var temp=Int((sender.value))
//        var newValue=5*floor(Double((temp/5))+0.5)
//        yourSlider.value = Float(newValue)
//        print(newValue)
//        myLabel.text="\(newValue)"
//
//    }
    
    
    @IBAction func updateSlider(_ sender: UISlider) {
        sender.setValue(Float(lroundf(yourSlider.value)), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

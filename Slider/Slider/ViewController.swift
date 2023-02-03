//
//  ViewController.swift
//  Slider
//
//  Created by Shraddha on 26/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mySlider: UISlider!
    
    @IBOutlet weak var myLabel: UILabel!
    var sliderLabel: UILabel?
    var s: Float = 0
    
    @IBAction func moveLabel(_ sender: UISlider) {
        let temp = sender.value
        adjustLabel(temp: temp)
        myLabel.text = "\(sender.value)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        s = Float(mySlider.frame.width)
//        mySlider.transform = CGAffineTransform(rotationAngle: .pi/2)
    }

    @IBOutlet weak var horizontalSpacing: NSLayoutConstraint!
    
    @IBAction func updateSlider(_ sender: UISlider) {
        var gg = Float(lroundf(mySlider.value))
        sender.setValue(gg, animated: true)
        adjustLabel(temp: gg)
        myLabel.text="\(sender.value)"
        
        if(gg == 1.0) {
            mySlider.minimumTrackTintColor = .yellow
        } else if(gg == 2.0) {
            mySlider.minimumTrackTintColor = .green
        } else if(gg == 3.0) {
            mySlider.minimumTrackTintColor = .red
        } else if(gg == 4.0) {
            mySlider.minimumTrackTintColor = .blue
        } else if(gg == 5.0) {
            mySlider.minimumTrackTintColor = .black
        }
    }
    
    func adjustLabel(temp: Float) {
        if(temp == 0) {
            horizontalSpacing.constant = CGFloat(40)
            return
        }
        var move = (temp / 5.0) * (s)
        horizontalSpacing.constant = CGFloat(move)
    }
}


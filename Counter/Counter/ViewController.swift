//
//  ViewController.swift
//  Counter
//
//  Created by Shraddha on 24/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    var cnt: Int=0
    let colors: [UIColor] = [ UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
                              UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0),
                              UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0),
                              UIColor(red: 0.5, green: 0.8, blue: 0.3, alpha: 1.0),
                              UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func incrementAction(_ sender: Any) {
        cnt += 1
        updateLabel(value: cnt)
    }
    @IBAction func decrementAction(_ sender: Any) {
        cnt -= 1
        updateLabel(value: cnt)
    }
    
    @IBAction func reserAction(_ sender: Any) {
        cnt = 0
        updateLabel(value: cnt)
    }
    
    func updateLabel(value: Int) {
        counterLabel.text = String(value)
        if value==0{
            counterLabel.textColor = .black
            return
        }
        print(colors.count)
        counterLabel.textColor = colors[value%5<0 ? -(value%5) : (value%5)]
    }
}


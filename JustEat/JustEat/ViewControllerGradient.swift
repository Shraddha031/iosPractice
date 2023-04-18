//
//  ViewControllerGradient.swift
//  JustEat
//
//  Created by Shraddha on 06/02/23.
//

import UIKit

class ViewControllerGradient: UIViewController {
    
    func setGradient(colorTop:UIColor, colorBottom:UIColor){
        var gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.frame = self.view.fr
        gradientLayer.frame = view.frame
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient(colorTop: UIColor(named: "DarkShade") ?? .white, colorBottom: UIColor(named: "lightShade") ?? .white)
        // Do any additional setup after loading the view.
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

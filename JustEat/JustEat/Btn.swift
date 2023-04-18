//
//  Btn.swift
//  JustEat
//
//  Created by Shraddha on 08/02/23.
//

import UIKit

class Btn: UIButton {
    let myButton = UIButton(type: .system)
    override init(frame: CGRect) {
        super.init(frame: frame)
        addColours()
        setBorder()
        setFonts()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addColours()
        setBorder()
        setFonts()
    }
    func addColours()
    {
        backgroundColor = UIColor(named: "blueShade")
        tintColor = .white
        
    }
    func setBorder(){
        layer.cornerRadius = layer.bounds.height / 4
        
    }
    func setFonts(){
        self.titleLabel?.font = UIFont(name: "Verdana",size:18)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
class SecondaryBtn: UIButton {
    let myButton = UIButton(type: .system)
    override init(frame: CGRect) {
        super.init(frame: frame)
        addColours()
        setBorder()
        setFonts()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addColours()
        setBorder()
        setFonts()
    }
    func addColours()
    {
        backgroundColor = .clear
        setTitleColor(UIColor(named: "blueShade"), for: .normal)
        
    }
    func setBorder(){
        layer.cornerRadius = layer.bounds.height / 4
        layer.borderWidth = 2.0
        layer.borderColor = UIColor(named: "blueShade")?.cgColor
        
    }
    func setFonts(){
        self.titleLabel?.font = UIFont(name: "Verdana",size:18)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
class ThirdBtn: UIButton {
    let myButton = UIButton(type: .system)
    override init(frame: CGRect) {
        super.init(frame: frame)
        addColours()
        setBorder()
        setFonts()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addColours()
        setBorder()
        setFonts()
    }
    func addColours()
    {
        backgroundColor = UIColor(named: "DarkShade")
        setTitleColor(.white, for: .normal)
        
    }
    func setBorder(){
        layer.cornerRadius = layer.bounds.height / 4
        
    }
    func setFonts(){
        self.titleLabel?.font = UIFont(name: "Verdana",size:18)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


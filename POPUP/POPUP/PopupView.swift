//
//  PopupView.swift
//  POPUP
//
//  Created by Shraddha on 27/01/23.
//

import UIKit

class PopupView: UIView {

    @IBOutlet weak var dialogView: UIView!
     @IBOutlet weak var myHeading: UILabel!
    
    @IBOutlet weak var secondaryButton: UIButton!
    @IBOutlet weak var primaryButton: UIButton!

    @IBOutlet weak var descriptionView: UILabel!
    override func draw(_ rect: CGRect) {
        // Drawing code
    
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("PopupView", owner: self, options: nil)
        customUI()
//        initSubview()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        initSubview()
    }
    
    private func customUI(){
        dialogView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        dialogView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        dialogView.clipsToBounds = true
        dialogView.layer.cornerRadius = 20
        primaryButton.backgroundColor = .blue
        secondaryButton.backgroundColor = .red
        primaryButton.layer.cornerRadius = 20
        secondaryButton.layer.cornerRadius = 20
        primaryButton.tintColor = .white
        secondaryButton.tintColor = .white

        
 
    }
    func showAlert(){
        let keyWindow = UIApplication.shared.windows.first
        keyWindow?.addSubview(dialogView)
    }
//    func loadView() -> UIView{
//
//
//        let bundleName = Bundle(for: type(of: self))
//        let nibName = String(describing: type(of: self))
//        let nib = UINib(nibName: nibName, bundle: bundleName)
////        let view = nib.instantiate(withOwner: nil, options: nil).first as! UIView
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//
//    }
    
//    func initSubview() {
//        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
//        nib.instantiate(withOwner: self, options: nil)
//
//
//    }
}

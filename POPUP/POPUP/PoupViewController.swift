//
//  PoupViewController.swift
//  POPUP
//
//  Created by Shraddha on 27/01/23.
//

import UIKit

class PoupViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBAction func secondaryButton(_ sender: UIButton) {
        hide()
    }
    @IBAction func primaryButton(_ sender: UIButton) {
    }
    init(){
        super.init(nibName: "PoupViewController", bundle: nil)
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
//        let vc  = ViewController()
//
        // Do any additional setup after loading the view.
    }
    func configView(){
        self.view.backgroundColor = .clear
        self.myView.alpha = 0
        self.myView.layer.cornerRadius = 20
    }
    
    func appear(sender: UIViewController){
        sender.present(self, animated: false){
            self.show()
        }
        
    }
    private func show(){
        UIView.animate(withDuration: 1, delay: 0.1){
            self.myView.alpha=1
        }
    }
    
    func hide(){
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseOut){
            self.myView.alpha=0
        }completion: { _ in
            self.dismiss(animated: false)
            self.removeFromParent()
        }
    }
}

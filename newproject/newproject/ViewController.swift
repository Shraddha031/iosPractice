//
//  ViewController.swift
//  newproject
//
//  Created by Shraddha on 19/01/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userMobileLabel: UILabel!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var userChildView: UIView!
    @IBOutlet weak var userMainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        perform()
        // Do any additional setup after loading the view.
    }

    func perform(){
        userNameLabel.isHidden = false
        userNameLabel.text = "asdfgh"
        userMobileLabel.text = "234567"
        userButton.setTitle("qwerty", for: .normal)
        userButton.setTitle("qwer", for: .highlighted)
        userChildView.backgroundColor = .purple
    }

    @IBAction func btnAction(_ sender: Any) {
//        userMobileLabel.text = "8786787"
//        userNameLabel.text = "palak"
//        print("Btn Action")
        var svc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController2") as? ViewController2
        navigationController?.pushViewController(svc!, animated: true)
    }
    
}

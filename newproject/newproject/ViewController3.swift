//
//  ViewController3.swift
//  newproject
//
//  Created by Shraddha on 23/01/23.
//

import UIKit

protocol MyDataSendingDelegateProtocol{
    func sendDataToFirstViewController(myData: Bool)
}

class ViewController3: UIViewController {
    
    // MARK: - Variable declaration
    var delegate: MyDataSendingDelegateProtocol? = nil
    var incomingName: String? = ""
    var incomingMarks: String? = ""
    @IBOutlet weak var label22: UILabel!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var label21: UILabel!
    var temp:Bool? = false
    override func viewDidLoad() {
        super.viewDidLoad()
        label21.text = incomingName
        label22.text = incomingMarks
        temp = switch1.isOn ? true : false
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.delegate?.sendDataToFirstViewController(myData:temp!)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        print("State for the Switch is :: \(sender.isOn)")
        temp=sender.isOn
        
        
    }
//    @IBAction func btn(_ sender: Any){
//        if self.delegate != nil && self.label21.text != nil {
//            let dataToBeSent = self.label21.text
//            self.delegate?.sendDataToFirstViewController(myData: dataToBeSent!)
//            dismiss(animated: true, completion: nil)
//
//        }
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


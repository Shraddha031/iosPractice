import UIKit

class ViewController: UIViewController {
    
    let temp = PopUpView()

    override func viewDidLoad() {
        super.viewDidLoad()
//        SharedPreference.shared.birthday = "Ashish"
        print(SharedPreference.shared.birthday)
        // Do any additional setup after loading the view.
        temp2()
    }
    

    @IBAction func btnAction(_ sender: UIButton) {
        temp.showAlert(title: "hiieeeeee", description: "ios", type: .doubleButton, caller: .first)
        
    }
    func temp2() {
        print("This function is \(#function)")
        PopUpView.popupAction = { [weak self] action in
            switch action {
            case .primary where SharedPreference.ClickedButton.first == SharedPreference.shared.callingVC:
                print("First Button primary")
            case .secondary where SharedPreference.ClickedButton.first == SharedPreference.shared.callingVC:
                print("Secondary Button primry")
            case .primary where SharedPreference.ClickedButton.second == SharedPreference.shared.callingVC:
                print("First Button secondary")
            case .secondary where SharedPreference.ClickedButton.second == SharedPreference.shared.callingVC:
                print("Secondary Button secondary")
            default:
                print("Default Case")
            }
        }
    }
    
    @IBAction func secondBtnAction(_ sender: UIButton) {
        temp.showAlert(title: "hellloo", description: "day 2", type: .singleButton, caller: .second)
    }
    
    
}


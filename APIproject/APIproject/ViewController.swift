//
//  ViewController.swift
//  APIproject
//
//  Created by Shraddha on 01/02/23.
//

import UIKit

class ViewController: UIViewController {
    var arr: [CustomersModel]?
    var popularMovies: [MovieModel]?

    @IBOutlet weak var nextPageBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        hitIt()
        nextPageBtn.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func hitApi(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2
        vc?.movies = popularMovies
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func hitIt() {
        
        NetworkManager.shared.requestForAPI(){ data in
            guard let data = data as? [String: Any] else {return}
            guard let values = data["results"] as? [[String: Any]] else {return}
            print(values)
            self.popularMovies = values.map{MovieModel(data: $0)}
            DispatchQueue.main.async { [weak self] in
                self?.nextPageBtn.isHidden = false
            }
//            print(va)
            print("Count\(values.count)")
        }
    }
}


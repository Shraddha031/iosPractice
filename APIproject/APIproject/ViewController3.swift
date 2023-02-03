//
//  ViewController3.swift
//  APIproject
//
//  Created by Shraddha on 01/02/23.
//

import UIKit

class ViewController3: UIViewController {
    var customer: CustomersModel?
    var movie: MovieModel?
    @IBOutlet weak var customerLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        customerLbl.text = movie?.overview
        print(movie)

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

//
//  ViewController1.swift
//  Counter
//
//  Created by Shraddha on 25/01/23.
//

import UIKit

struct Movie {
    var image: UIImage
    var name: String
}

class ViewController1: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    let images = [UIImage(named: "Image"),
                  UIImage(named: "Image 1"),
                  UIImage(named: "Image 2"),
                  UIImage(named: "Image 3"),
                  UIImage(named: "Image 4")]
    let names:[String]=["fightclub","godfather","hangover","butterfly","titanic"]
    
    var movies: [Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        for i in 0...4 {
            movies.append(Movie(image: images[i] ?? UIImage(), name: names[i] ))
        }
    }
}

extension ViewController1: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        cell?.movieLabel.text = movies[indexPath.row].name
        cell?.movieImage.image = movies[indexPath.row].image
        return cell!
    }
    
    
}

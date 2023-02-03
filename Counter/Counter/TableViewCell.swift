//
//  TableViewCell.swift
//  Counter
//
//  Created by Shraddha on 25/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        movieLabel.text = "HIJ"
//        movieImage.image=U
        movieImage.image = UIImage(named: "Image")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

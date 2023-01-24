//
//  TableViewCell.swift
//  newproject
//
//  Created by Shraddha on 20/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var ProblemView: UIView!
    @IBOutlet weak var label1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        label1.text="Hi"
        Label2.text="how are you"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  MyCellTableViewCell.swift
//  TableViewLab
//
//  Created by user234888 on 10/20/23.
//

import UIKit

class MyCellTableViewCell: UITableViewCell {

    @IBOutlet weak var carsName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

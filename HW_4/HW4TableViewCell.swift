//
//  HW4TableViewCell.swift
//  HW_4
//
//  Created by Sungur Gasanov on 10.12.2021.
//

import UIKit

class HW4TableViewCell: UITableViewCell {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var cellimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

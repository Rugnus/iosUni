//
//  TableViewCell.swift
//  HW_4
//
//  Created by Даниил Алексеев on 08.12.2021.
//

import UIKit

class HWTableViewCell: UITableViewCell {


    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

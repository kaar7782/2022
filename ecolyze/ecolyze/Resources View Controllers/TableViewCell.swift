//
//  TableViewCell.swift
//  ecolyze
//
//  Created by Kareena Arora on 2/7/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var label1: UILabel!
    @IBOutlet var image1: UIImageView!
    @IBOutlet var readMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

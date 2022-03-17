//
//  ChallengesTableViewCell.swift
//  ecolyze
//
//  Created by Kareena Arora on 2/12/22.
//

import UIKit

class ChallengesTableViewCell: UITableViewCell {
    
    @IBOutlet var habitLabel: UILabel!
    @IBOutlet var carbonLabel: UILabel!
    @IBOutlet var button: UIButton!
    
    @IBAction func didTapButton(){
        
        
    }
    
//    func configure(with title: String){
//        button.setTitle(title, for: .normal)
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        //button.setTitleColor(.link, for: .normal)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

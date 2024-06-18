//
//  DinosaurListTableViewCel.swift
//  Assignment
//
//  Created by MahipalReddy on 18/06/24.
//

import UIKit

class DinosaurListTableViewCel: UITableViewCell {

    @IBOutlet weak var dinosaurName: UILabel!
    @IBOutlet weak var dinosaurImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dinosaurImageView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
}

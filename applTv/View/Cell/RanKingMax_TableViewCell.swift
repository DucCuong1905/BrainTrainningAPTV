//
//  Frame23_TableViewCell.swift
//  applTv
//
//  Created by dev-sonpipi on 22/10/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import UIKit

class RanKingMax_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var ratingsLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var goldCupImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var scoresLabel: UILabel!
    @IBOutlet var starImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        starImage?.image = UIImage(named: "Star 4 (1)")
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

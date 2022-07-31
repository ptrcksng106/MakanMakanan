//
//  FoodTableViewCell.swift
//  MakanMakanan
//
//  Created by Patrick Sinaga on 29/07/22.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    

    @IBOutlet var foodDescription: UILabel!
    @IBOutlet var foodTitle: UILabel!
    @IBOutlet var foodImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

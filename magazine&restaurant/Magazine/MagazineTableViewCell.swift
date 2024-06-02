//
//  MagazineTableViewCell.swift
//  magazine&restaurant
//
//  Created by 홍석평 on 5/27/24.
//

import UIKit

class MagazineTableViewCell: UITableViewCell {

    
    @IBOutlet var mainImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    
    @IBOutlet var subtitleLabel: UILabel!
    
    
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

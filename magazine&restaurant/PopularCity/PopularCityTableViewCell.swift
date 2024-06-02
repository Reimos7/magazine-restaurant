//
//  PopularCityTableViewCell.swift
//  CityTravelTab
//
//  Created by 홍석평 on 6/3/24.
//

import UIKit

class PopularCityTableViewCell: UITableViewCell {

    @IBOutlet var popularCityTitleLabel: UILabel!
    
    @IBOutlet var popularCityListLabel: UILabel!
    
    @IBOutlet var popularCityImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

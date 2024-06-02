//
//  CityTableViewCell.swift
//  magazine&restaurant
//
//  Created by 홍석평 on 6/1/24.
//

import UIKit
import Kingfisher

class CityTableViewCell: UITableViewCell {

    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var travelImage: UIImageView!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var saveLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data: Travel){
        
        if let image = data.travel_image,
           let url = URL(string: image) {
            travelImage.kf.setImage(with: url)
            travelImage.contentMode = .scaleAspectFill
           // travelImage.layer.cornerRadius = .
        }
        titleLabel.font = .boldSystemFont(ofSize: 17)
        
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.numberOfLines = 0
        
        gradeLabel.text = data.gradeDescription
        gradeLabel.font = .systemFont(ofSize: 14)
        gradeLabel.textColor = .lightGray
        
        saveLabel.text = data.saveDescription
        saveLabel.font = .systemFont(ofSize: 14)
        saveLabel.textColor = .lightGray
        
       likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
    
    
    }
    
}
 

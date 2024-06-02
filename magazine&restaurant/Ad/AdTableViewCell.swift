//
//  AdTableViewCell.swift
//  magazine&restaurant
//
//  Created by 홍석평 on 6/1/24.
//

import UIKit

class AdTableViewCell: UITableViewCell {

    
    @IBOutlet var adTitleLabel: UILabel!
    
    @IBOutlet var adSymbolLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureAdCell (data: Travel) {
        self.backgroundColor = .random
        
        adTitleLabel.text = data.title
        adTitleLabel.textAlignment = .center
        adTitleLabel.font = .boldSystemFont(ofSize: 18)
        adTitleLabel.numberOfLines = 0
        
        adSymbolLabel.text = "AD"
        adSymbolLabel.font = .systemFont(ofSize: 14)
        adSymbolLabel.layer.cornerRadius = 6
        adSymbolLabel.layer.borderWidth = 2
        adSymbolLabel.layer.borderColor = UIColor.white.cgColor
        adSymbolLabel.layer.backgroundColor = UIColor.white.cgColor
        //adSymbolLabel.backgroundColor = .white
    }
}

// 배경색 랜덤
extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}

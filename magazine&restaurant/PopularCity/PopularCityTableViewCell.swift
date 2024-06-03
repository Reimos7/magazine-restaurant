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
        
        // UILabel의 왼쪽 상단과 오른쪽 하단 모서리를 둥글게 만들고, 반지름이 20인 둥근 모서리를 설정하며, 경계를 벗어나는 부분을 잘라줌
        popularCityImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        popularCityImage.layer.cornerRadius = 20
        popularCityImage.clipsToBounds = true
        popularCityImage.contentMode = .scaleAspectFill
        
        popularCityTitleLabel.textAlignment = .right
        popularCityTitleLabel.textColor = .white
        popularCityTitleLabel.font = .boldSystemFont(ofSize: 17)
        
        popularCityListLabel.textColor = .white
        popularCityListLabel.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
    }

    func configureCell(data: City){
        let url = URL(string: data.city_image)
        popularCityImage.kf.setImage(with: url)

        popularCityTitleLabel.text = data.titleNames
        
        popularCityListLabel.text = data.city_explain
        
    }
    
}

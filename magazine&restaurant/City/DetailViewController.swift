//
//  DetailViewController.swift
//  magazine&restaurant
//
//  Created by 홍석평 on 6/2/24.
//

import UIKit

class DetailViewController: UIViewController {

    
    
    @IBOutlet var mainImage: UIImageView!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    //데이터 전달: 1.데이터를 받을 수 있는 공간 만들기
    var data: Travel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //데이터 전달: 3.전달 받은 값을 뷰에다가 표현하면 끝
        guard let data else {return}
        navigationItem.title = "\(data.title) | \(data.grade ?? 0.0)점"
        descriptionLabel.text = data.description
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        
        //mainImage.image = UIImage(data.travel_image)
        
    }
    
    
    
    
    

   

}

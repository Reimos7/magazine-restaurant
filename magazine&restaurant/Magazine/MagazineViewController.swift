//
//  MagazineViewController.swift
//  magazine&restaurant
//
//  Created by 홍석평 on 5/27/24.
//

import UIKit
import Kingfisher
class MagazineViewController:  UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    
    @IBOutlet var tableView: UITableView!
    // 매거진 가져오기
    var list = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 500
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationItem.title = "SeSAC TRAVEL"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell", for: indexPath) as! MagazineTableViewCell
        
        let data = list[indexPath.row]
        
        
        var date = DateFormatter()
        date.dateFormat = "yy년 MM월 dd일"
        
        let currentDate = Date()
        let formattedDate = date.string(from: currentDate)
       // cell.dateLabel.text = data.date
        
     
        cell.titleLabel.text = data.title
        cell.titleLabel.numberOfLines = 0
        cell.subtitleLabel.text = data.subtitle
        cell.dateLabel.text = data.date
        
        let url = URL(string: data.photo_image)
        cell.mainImageView.kf.setImage(with: url)
        cell.mainImageView.contentMode = .scaleAspectFill
        cell.mainImageView.layer.cornerRadius = 20
        
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        cell.subtitleLabel.font = .systemFont(ofSize: 17)
        cell.subtitleLabel.textColor = .darkGray
        cell.dateLabel.textColor = .darkGray
        cell.dateLabel.font = .boldSystemFont(ofSize: 16)
        
        //cell.dateLabel.text = data.date
        return cell
    }
    

}

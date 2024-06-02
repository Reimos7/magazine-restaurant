//
//  CityViewController.swift
//  magazine&restaurant
//
//  Created by 홍석평 on 6/1/24.
//

import UIKit
import Kingfisher

class CityViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    
    var list = TravelInfo.travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "도시 상세 정보"
        tableView.rowHeight = 120
        tableView.dataSource = self
        tableView.delegate = self
        
        // cell 에서 사용할 indentifel 븉이기
        
        let xib = UINib(nibName: "CityTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "CityTableViewCell")
        
        let xib2 = UINib(nibName: "AdTableViewCell", bundle: nil)
        tableView.register(xib2, forCellReuseIdentifier: "AdTableViewCell")
        
    }
    
    
    
    
}
extension CityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let data = list[indexPath.row]
        
        if data.ad {
            
            let cellAd = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as! AdTableViewCell
            
            cellAd.configureAdCell(data: data)
            
            return cellAd
            
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
            
            cell.titleLabel.text = data.title
            cell.descriptionLabel.text = data.description
            cell.configureCell(data: data)
           
           return cell
        }
    }
    
}

extension CityViewController: UITableViewDelegate {
 
    // 셀을 클릭했을때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = list[indexPath.row]
        
        if data.ad {
          // 광고 화면
           
            let sb = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: "CityViewController") as! AdViewController
            
            present(vc, animated: true)
           
        }else {
        
            //관광지 화면
            //1.같은 스토리보드 내에서 뷰 컨트롤러 가져오기
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController)
            
            vc.data = list[indexPath.row] //데이터 전달:
            
            //2.화면 띄우기
            navigationController?.pushViewController(vc, animated: true)
        
        }
        tableView.reloadData()
    }
}

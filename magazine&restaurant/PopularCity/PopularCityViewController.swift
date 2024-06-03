//
//  PopularCityViewController.swift
//  CityTravelTab
//
//  Created by 홍석평 on 6/3/24.
//

import UIKit

class PopularCityViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    // 도시 정보
    var list = CityInfo.city
    
    // 도시 빈배열
    var filterList: [City] = []
    
    // 한국 도시 정보 빈배열
    var filterKoreaList: [City] = []
    
    // 해외 도시 정보 빈배열
    var filterForeignList: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "인기 도시"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        
        // xib 사용
        let xib = UINib(nibName: "PopularCityTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "PopularCityTableViewCell")
        
    }
    
    
    // 세그먼트 컨트롤
    @IBAction func segmentedControlClicked(_ sender: UISegmentedControl) {
        
        // 모두를 클릭했을때
        if sender.selectedSegmentIndex == 0 {
            
            // 빈배열에 모든 정보 저장
            filterList = list
            tableView.reloadData()
            
        }else if sender.selectedSegmentIndex == 1 {
         
            for item in list {
                
                if item.city_name == "제주" || item.city_name == "부산" || item.city_name == "전주" || item.city_name == "서울" || item.city_name == "대전" {
                    
                    filterKoreaList.append(item)
                }
            }
            filterList = filterKoreaList
            tableView.reloadData()
            
            
        } else {
      
            for item in list {
                
                let cityName = item.city_name
                
                if cityName == "방콕" || cityName == "오사카" || cityName == "다낭" || cityName == "파리" || cityName == "시드니" || cityName == "밀라노" || cityName == "리스본" || cityName == "두바이" || cityName == "홍콩" {
                    
                    filterForeignList.append(item)
                }
            }
            filterList = filterForeignList
            tableView.reloadData()
        }
        
    }
    
}
extension PopularCityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularCityTableViewCell", for: indexPath) as! PopularCityTableViewCell
        
        let data = filterList[indexPath.row]
        
        cell.configureCell(data: data)
        
        return cell
    }
    
}

extension PopularCityViewController: UITableViewDelegate {
    
    
}

//
//  RestaurantViewController.swift
//  magazine&restaurant
//
//  Created by 홍석평 on 5/27/24.
//

import UIKit
import Kingfisher
class RestaurantViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {
    
    
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var restaurantTableView: UITableView!
    
    // 레스토랑 정보 배열로 저장
    var list = RestaurantList().restaurantArray
    //
    var filteredList: [Restaurant] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        restaurantTableView.dataSource = self
        restaurantTableView.delegate = self
        restaurantTableView.rowHeight = 100
        
        var left = UIBarButtonItem(title: "한식", style: .plain, target: self, action: #selector(leftBarButtonClicked))
        
        var all = UIBarButtonItem(title: "전체", style: .plain, target: self, action: #selector(allButtonClicked))
        navigationItem.rightBarButtonItems = [left,all]
        
        
        let xib = UINib(nibName: "RestaurantTableViewCell", bundle: nil)
        restaurantTableView.register(xib, forCellReuseIdentifier: "RestaurantTableViewCell")

    }
    
    
    @objc func allButtonClicked(){
        // 빈배열에 리스트 (레스토랑) 저장
        filteredList = list
        // 싱크 설정
        restaurantTableView.reloadData()
    }
    
    @objc func leftBarButtonClicked(){
        // 한식 빈배열
        var koreanFood: [Restaurant] = []
        //
        for item in list {
            // 레스토랑의 카테고리에서 한식이 있다면..
            // koreanFood배열에 추가한다
            if item.category == "한식"{
                koreanFood.append(item)
            }
        }
        filteredList = koreanFood
        restaurantTableView.reloadData()
    }
    
    // 서치바에서 서치버튼 클릭시
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // 전체 데이터 기준으로 검색해야 하기 때문에 list
        
        var searchList: [Restaurant] = []
        
        for item in list {
           
            // 검색어에 있는 단어가 포함되어 있으면 ..
            // 이름이랑 카테고리 둘다 설정
            // == 은 무조건 띄어쓰기랑 전부 같아야 검색됨
            if item.name.contains(searchBar.text!) || item.category.contains(searchBar.text!){
            
                searchList.append(item)
            }
        }
        
        filteredList = searchList
        restaurantTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = restaurantTableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
        
        let cell = restaurantTableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
        
        let data = list[indexPath.row]
        
       
        let url = URL(string: data.image)
        cell.mainImageView.kf.setImage(with: url)
        
        cell.titleLabel.text = data.name
        cell.titleLabel.numberOfLines = 0
        cell.subtitleLabel.text = data.category
        cell.descriptionLabel.text = data.address

        
        cell.mainImageView.contentMode = .scaleAspectFill
        cell.mainImageView.layer.cornerRadius = 20
        
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        
        cell.subtitleLabel.font = .systemFont(ofSize: 17)
        cell.subtitleLabel.textColor = .darkGray
       
        cell.descriptionLabel.font = .systemFont(ofSize: 13)
        cell.descriptionLabel.textColor = .darkGray
        cell.descriptionLabel.numberOfLines = 0
        
        return cell
    }
    

   

}

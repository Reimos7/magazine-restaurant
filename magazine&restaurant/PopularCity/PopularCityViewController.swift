//
//  PopularCityViewController.swift
//  CityTravelTab
//
//  Created by 홍석평 on 6/3/24.
//

import UIKit

class PopularCityViewController: UIViewController {

    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
    }
    

   
}
extension PopularCityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

extension PopularCityViewController: UITableViewDelegate {
    
    
}

//
//  ViewController.swift
//  Safe_Restaurant_to_TableView
//
//  Created by 준수김 on 2021/10/14.
//

import UIKit

class ViewController: UIViewController{
  
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var row = [Row]()
    var model = RestaurantModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTableView()
        tableView.rowHeight = UITableView.automaticDimension
        
        model.delegate = self
        model.getRestaurants()
    }
    private func setUpTableView() {
        tableView.delegate = self
        //"tableView한테 이벤트가 발생하면 프로토콜에 따라 ViewController가 tableView에게 응답을 줄게."
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCell") //MemoTableViewCell이름의 XIB를 tableView에 등록한다.
    }

}

extension ViewController: RestaurantModelProtocol {
    // MARK: ArticleModelProtocol functions
    func RestaurantsRetrieved(row: [Row]) {
        print("articles retrieved from article model!")
        self.row = row
        tableView.reloadData()
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.row.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        let restaurant = self.row[indexPath.row]
        cell.displayRastaurant(row: restaurant)
        
        // TODO: customize it
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return UITableView.automaticDimension
        
    }

    
}

//
//  Reqeust.swift
//  Safe_Restaurant_to_TableView
//
//  Created by 준수김 on 2021/10/14.
//

import Foundation

protocol RestaurantModelProtocol {
    func RestaurantsRetrieved(row : [Row])
}

class RestaurantModel {
    
    var delegate:RestaurantModelProtocol?
    
    func getRestaurants() {
        
        let urlString = "http://211.237.50.150:7080/openapi/57c98321a0a1a87daac8477bfa1863558b3c7163cd54c0cd3b9e58e9058dc6d0/json/Grid_20200713000000000605_1/1/100?RELAX_SI_NM=%EA%B2%BD%EC%83%81%EB%B6%81%EB%8F%84&RELAX_SIDO_NM=%EA%B5%AC%EB%AF%B8%EC%8B%9C"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        
        let session = URLSession.shared
        
        let datatask = session.dataTask(with: url!) { (data, response, error) in
        
        if error == nil && data != nil {
            let decoder = JSONDecoder()
            
            do {
                
                let restaurantService = try decoder.decode(ResponseService.self, from: data!)
                
                DispatchQueue.main.async {
                    self.delegate?.RestaurantsRetrieved(row: restaurantService.Grid_20200713000000000605_1.row)
                }
                
            }
            catch {
                print("Error parsing the json")
            }
            
            
        }
        
        
        
    }
        datatask.resume()
}

}

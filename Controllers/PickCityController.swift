//
//  PickCityController.swift
//  charger_onWork
//
//  Created by Kaan Alkan on 25.07.2022.
//

import UIKit
import Alamofire

class PickCityController: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchCityBar: UISearchBar!
    
    var filteredCity:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCityBar.searchTextField.textColor = UIColor.white
        searchCityBar.layer.cornerRadius = 20
        
        filteredCity = DataIWant
        
        tableView.reloadData()
        searchCityBar.delegate = self
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        fetchData()
    }
    
  

    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    var DataIWant: [String] = []
//
//    var responseArray: [Any] = []


    var city : [cityModel] = []
    func fetchData() {


        let headers: HTTPHeaders = ["Content-Type": "application/json", "token" :  UserInfo.instance.token!]
     DispatchQueue.main.async {
        AF.request(URL(string: "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/provinces?userID=\(UserInfo.instance.userId ?? 1)")!,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: headers)
        .responseJSON { response in
            if let responseData = response.data {
                print(responseData)
                do {
                    let decodeJson = JSONDecoder()
                    let apiResponse =  try decodeJson.decode([String].self, from: responseData)
                    for item in apiResponse {
                        self.DataIWant.append(item)
                    }
                    self.tableView.reloadData()
                    print(apiResponse)
                } catch {
                    print(String(describing: error))
                }
            }
        }

    }
}
}
extension PickCityController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        if searchCityBar.searchTextField.text == "" {
            cell.textLabel?.text = DataIWant[indexPath.item]
        } else  {cell.textLabel?.text = filteredCity[indexPath.item]}
        cell.textLabel?.textColor = UIColor.white
   
        return cell
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchCityBar.searchTextField.text == "" {
            return DataIWant.count} else {
                return filteredCity.count
            }
    }

    func numberOfSections(in tableView: UITableView) -> Int { return 1 }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCity = []
        
        if searchText == "" {
            filteredCity = DataIWant
        } else {
        
        for city in DataIWant {
            if city.lowercased().contains(searchText.lowercased()) {
                filteredCity.append(city)
            }
        }
    }
        self.tableView.reloadData()
    }

}

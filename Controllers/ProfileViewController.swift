//
//  ProfileViewController.swift
//  charger_onWork
//
//  Created by Kaan Alkan on 14.07.2022.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {
    
    private let button = UIButton()

    var emailInfo = ""
  
    
    @IBOutlet weak var emailInfoLabel: UILabel!
    @IBOutlet weak var udidLabel: UILabel!
    
    
    
    @IBOutlet weak var takenEmailLabel: UILabel!
    @IBOutlet weak var takenUdidLabel: UILabel!
    
    @IBOutlet weak var rectangleView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        takenEmailLabel.text = UserInfo.instance.email
        title = "Profil"
        takenUdidLabel.text = "\(String(describing: UserInfo.instance.userId))"
//        configureItems()
        
        
    }

    @IBAction func backButton(_ sender: UIButton) {

        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        
        fetchData()
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(resultViewController, animated: true)
        
        
     
    }
    //    private func configureItems () {
//
//        navigationItem.leftBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .add,
//            target: self,
//            action: nil)
//
//    }



    
    



func fetchData() {
    
    
    let headers: HTTPHeaders = ["Content-Type": "application/json", "token" :  UserInfo.instance.token!]
     DispatchQueue.main.async {
        AF.request(URL(string: "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/auth/logout/\(UserInfo.instance.userId!)")!,
                   method: .post,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: headers)
        .responseJSON { response in
            if let responseData = response.data {
//                print(responseData)
                do {
                    let decodeJson = JSONDecoder()
                    let apiResponse =  try decodeJson.decode([String].self, from: responseData)
              
                    
                    
                } catch {
                    print(String(describing: error))
                }
            }
        }
        
    }
}


}

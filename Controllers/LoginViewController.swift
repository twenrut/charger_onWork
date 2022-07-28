//
//  LoginViewController.swift
//  charger_onWork
//
//  Created by Kaan Alkan on 12.07.2022.
//

import UIKit
import Alamofire
import CoreLocation

class LoginViewController: UIViewController,CLLocationManagerDelegate {
    
    //    weak var delegate: LoginViewControllerDelegate?
    var locationManager: CLLocationManager?
    var email = ""
    
    var userInfo : UserInfo?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var welcomeInfoLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UITextField!
    
    
    
    @IBAction func login(_ sender: UIButton) {
        fetchData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.requestAlwaysAuthorization()
        
    }
    var responseArray: APIModel?
    
    
    func fetchData() {
        
        UserInfo.instance.email = emailLabel.text
        
        let parameters: [String:Any] = [
            "email": emailLabel.text,
            "deviceUDID": "deviceUDID"
        ]
        let headers: HTTPHeaders? = ["Content-Type": "application/json"]
        return DispatchQueue.main.async {
            AF.request(URL(string: "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/auth/login")!,
                       method: .post,
                       parameters: parameters,
                       encoding: JSONEncoding.default,
                       headers: headers)
            .responseJSON { response in
                if let responseData = response.data {
                    print(responseData)
                    do {
                        let decodeJson = JSONDecoder()
                        let apiResponse =  try decodeJson.decode(APIModel.self, from: responseData)
                        
                        UserInfo.instance.token = apiResponse.token
                        UserInfo.instance.userId = apiResponse.userID
                        
                        
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "ReservationViewController") as! ReservationViewController
                        self.navigationController?.pushViewController(resultViewController, animated: true)
                        
                    } catch {
                        print(String(describing: error))
                    }
                }
            }
            
        }
    }
    
}







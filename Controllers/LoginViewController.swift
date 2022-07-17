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
    
    weak var delegate: LoginViewControllerDelegate?
    var locationManager: CLLocationManager?
    var email = ""
    
    
    @IBOutlet weak var welcomeLabel: UILabel!

    @IBOutlet weak var welcomeInfoLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UITextField!
    
    
   
    @IBAction func login(_ sender: UIButton) {
        fetchData()
        self.email = self.emailLabel.text!
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
           
        
        
        self.performSegue(withIdentifier: "mainScreen", sender: self)
            self.performSegue(withIdentifier: "profileScreen", sender: self)


//    }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileScreen" {
        let vc = segue.destination as! ProfileViewController
        vc.emailInfo = email
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailLabel.text = "kullanici@gmail.com"
//        fetchData()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        // Do any additional setup after loading the view.
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            
//        // Create a variable to store the name the user entered on textField
//        let emailName = emailLabel.text ?? ""
//            
//        // Create a new variable to store the instance of the SecondViewController
//        // set the variable from the SecondViewController that will receive the data
//        let destinationVC = segue.destination as! ProfileViewController
//        destinationVC.takenEmailLabel = emailLabel
//    }
    var responseArray: APIModel?


    func fetchData() {
        
        let parameters: [String:Any] = [
            "email": emailLabel.text,
            "deviceUDID": "deviceUDID"
        ]
    let headers: HTTPHeaders? = ["Content-Type": "application/json"]
        DispatchQueue.main.async {
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
                        self.responseArray =  try decodeJson.decode(APIModel.self, from: responseData)
                    } catch {
                        print(String(describing: error))
                    }
                }
            }
           
                   }
    }
    
    
}


    



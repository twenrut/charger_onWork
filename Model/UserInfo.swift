//
//  LoginModel.swift
//  charger_onWork
//
//  Created by Kaan Alkan on 14.07.2022.
//

import Foundation
import Alamofire

//
//struct UserInfo {
//    let email : String
//    let UserID : Int
//
//}
//



class UserInfo {
    static let instance = UserInfo()
    
    var email: String?
    var userId: Int?
    var token: String?
    
    private init() {}
}



//        let vc = ReservationViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//        vc.view.backgroundColor = .white
//

//        self.email = self.emailLabel.text!


//        vc.navigationItem.
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    
//        }


//            self.performSegue(withIdentifier: "profileScreen", sender: self)


//}

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "profileScreen" {
//        let vc = segue.destination as! ProfileViewController
//        vc.emailInfo = email
//    }
//    }
//emailLabel.text = "kullanici@gmail.com"
  

       
//        locationManager = CLLocationManager()
//        locationManager?.delegate = self
//        locationManager?.requestAlwaysAuthorization()
       
       // Do any additional setup after loading the view.
//   }
   
   
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        // Create a variable to store the name the user entered on textField
//        let emailName = emailLabel.text ?? ""
//
//        // Create a new variable to store the instance of the SecondViewController
//        // set the variable from the SecondViewController that will receive the data
//        let destinationVC = segue.destination as! ProfileViewController
//        destinationVC.takenEmailLabel = emailLabel
////    }

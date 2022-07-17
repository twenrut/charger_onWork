//
//  ProfileViewController.swift
//  charger_onWork
//
//  Created by Kaan Alkan on 14.07.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
   var emailInfo = ""
  
    
    @IBOutlet weak var emailInfoLabel: UILabel!
    @IBOutlet weak var udidLabel: UILabel!
    
    
    
    @IBOutlet weak var takenEmailLabel: UILabel!
    @IBOutlet weak var takenUdidLabel: UILabel!
    
    @IBOutlet weak var rectangleView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        takenEmailLabel.text = emailInfo
        
    }

//    if var viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "BViewController") as? BViewController {
//        viewController.modalPresentationStyle = .fullScreen
//        self.present(viewController, animated: true, completion: nil)
    }
    
    

    

    




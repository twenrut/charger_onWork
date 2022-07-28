//
//  ReservationViewController.swift
//  charger_onWork
//
//  Created by Kaan Alkan on 16.07.2022.
//

import UIKit

class ReservationViewController: UIViewController {

    
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var rezervationInfoLabel: UILabel!
    @IBOutlet weak var rezervationHelpInfoLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    
    @IBAction func profileButton(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.navigationController?.pushViewController(resultViewController, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        navBar.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func makeReservationButton(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "PickCityController") as! PickCityController
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

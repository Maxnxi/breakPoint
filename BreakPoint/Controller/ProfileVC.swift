//
//  ProfileVC.swift
//  BreakPoint
//
//  Created by Maksim Ponomarev on 25.11.2020.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileLbl: UILabel!
    @IBOutlet weak var profileImgView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.profileLbl.text = Auth.auth().currentUser?.email
    }

    
    @IBAction func logoutBtnWasPressd(_ sender: Any) {
        let logOutPop = UIAlertController(title: "Alert", message: "Are you sure to logout?", preferredStyle: .actionSheet)
        let logOutAction = UIAlertAction(title: "Logout", style: .destructive) { (btnTaped) in
            do{
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                print("Logout done!")
                authVC?.modalPresentationStyle = .fullScreen
                self.present(authVC!, animated: true, completion: nil)
            } catch {
                print("Error #6.1 while logout action \(error)")
            }
        }
        logOutPop.addAction(logOutAction)
        present(logOutPop, animated: true, completion: nil)
    }
    
}

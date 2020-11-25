//
//  AuthVC.swift
//  BreakPoint
//
//  Created by Maksim Ponomarev on 22.11.2020.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signInWithFacebookBtnWasPressed(_ sender: Any) {
//        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
//        loginVC?.modalPresentationStyle = .fullScreen
//        present(loginVC!, animated: true, completion: nil)
    }
    @IBAction func signInWithGooglePlusBtnWasPressed(_ sender: Any) {
    }
    @IBAction func signInwithEmailBtnWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        loginVC?.modalPresentationStyle = .fullScreen
        present(loginVC!, animated: true, completion: nil)
    }
    

}

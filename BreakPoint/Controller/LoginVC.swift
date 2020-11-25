//
//  LoginVC.swift
//  BreakPoint
//
//  Created by Maksim Ponomarev on 22.11.2020.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var passwordTxtField: InsetTxtField!
    @IBOutlet weak var emailTxtField: InsetTxtField!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxtField.delegate = self
        passwordTxtField.delegate = self

    }
    
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        if emailTxtField.text != nil {
            if passwordTxtField.text != nil{
                
                AuthService.instance.loginUser(withEmail: emailTxtField.text!, andPassword: passwordTxtField.text!, loginComplete: { (success, loginError) in
                    if success {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        print("Error #1.1 login \(String(describing: loginError?.localizedDescription))")
                    }
                    
                    AuthService.instance.registerUser(withEmail: self.emailTxtField.text!, andPassword: self.passwordTxtField.text!, userCreationComplete: { (success, registrationError) in
                        if success {
                            
                            AuthService.instance.loginUser(withEmail: self.emailTxtField.text!, andPassword: self.passwordTxtField.text!, loginComplete: { (succes, nil) in
                               print("\nSuccessfully registered user!")
                                self.dismiss(animated: true, completion: nil)
                            })
                        } else {
                            debugPrint("Error #1.2 register \(String(describing: registrationError?.localizedDescription))")
                        }
                    })
                })
            }
        }
    }
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   

}


extension LoginVC: UITextFieldDelegate {
    
}

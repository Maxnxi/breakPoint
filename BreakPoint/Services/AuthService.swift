//
//  AuthService.swift
//  BreakPoint
//
//  Created by Maksim Ponomarev on 23.11.2020.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping(_ status: Bool, _ error: Error?) -> ()) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            print("\n\n authresult is: \(authResult)")
            guard let user = authResult?.user else {
                userCreationComplete(false, error)
                print("\n\nerror #3.2 fail to get authresult? \n \(error?.localizedDescription)")
                return
            }
            print("\n\nUser is:\(user)")
            //wtf
            let userInfoData = ["provider": user.providerID , "email": user.email]
            
            DataService.instance.createDBUser(uid: user.uid, userData: userInfoData)
            userCreationComplete(true,nil)
            
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping(_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                loginComplete(false, error)
                return
            
//            guard let user = authResult?.user else {
//                loginComplete(false, error)
//                return
            }
            loginComplete(true, nil)
        }
    }
    
}

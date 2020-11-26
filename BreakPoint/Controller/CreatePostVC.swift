//
//  CreatePostVC.swift
//  BreakPoint
//
//  Created by Maksim Ponomarev on 25.11.2020.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userImgView: UIImageView!
    @IBOutlet weak var sendBtn: UIButton!
    
        override func viewDidLoad() {
        super.viewDidLoad()
            textView.delegate = self
            sendBtn.isEnabled = true
            sendBtn.bindToKeyboard()
            //textView.bindToKeyboard()
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userEmailLbl.text = Auth.auth().currentUser?.email
    }
    

    @IBAction func sendBtnWasPressed(_ sender: Any) {
        print("Send btn was pressed")
        if textView.text != nil && textView.text != "Print message here" {
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil) { (isComplete) in
                if isComplete {
                    print("\nmessage sent \(String(describing: self.textView.text))")
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendBtn.isEnabled = true
                    print("Error #5.1")
                }
            }
        }
        
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CreatePostVC : UITextViewDelegate {
   
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
}

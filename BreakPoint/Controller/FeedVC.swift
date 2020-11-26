//
//  FeedVC.swift
//  BreakPoint
//
//  Created by Maksim Ponomarev on 25.11.2020.
//

import UIKit

class FeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addBtnWasPressd(_ sender: Any) {
        
        let createPostVC = storyboard?.instantiateViewController(withIdentifier: "CreatePostVC")
        createPostVC?.modalPresentationStyle = .fullScreen
        present(createPostVC!, animated: true, completion: nil)
        
    }
    
   

}

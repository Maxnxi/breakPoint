//
//  FeedVC.swift
//  BreakPoint
//
//  Created by Maksim Ponomarev on 25.11.2020.
//

import UIKit

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
   
    
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (retunedMessagesArray) in
            self.messageArray = retunedMessagesArray
            self.tableView.reloadData()
        }
    }
    

    @IBAction func addBtnWasPressd(_ sender: Any) {
        
        let createPostVC = storyboard?.instantiateViewController(withIdentifier: "CreatePostVC")
        createPostVC?.modalPresentationStyle = .fullScreen
        present(createPostVC!, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else {return UITableViewCell()}
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        
        cell.configureCell(profileImage: image!, email: message.senderId, content: message.content)
        return cell
    }

}

//
//  FeedCell.swift
//  BreakPoint
//
//  Created by Maksim Ponomarev on 26.11.2020.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var messageOfUserLbl: UILabel!
    @IBOutlet weak var userEmailLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(profileImage: UIImage, email: String, content:String){
        self.userProfileImage.image = profileImage
        self.messageOfUserLbl.text = content
        self.userEmailLbl.text = email
        
    }

}

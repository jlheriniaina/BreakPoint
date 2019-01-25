//
//  FeedCell.swift
//  BreakPoint
//
//  Created by lucas on 21/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var messageContentLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(avatar : UIImage,email : String ,message : Message) {
        self.avatarImageView.image = avatar
        self.emailLbl.text = email
        self.messageContentLbl.text = message.content
    }
}

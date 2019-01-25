//
//  UserCell.swift
//  BreakPoint
//
//  Created by lucas on 22/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    var show = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if show == false {
            if selected {
                self.checkImageView.isHidden = false
                show = true
            }else {
                self.checkImageView.isHidden = true
                show = false
            }
            
        }
    }
    func configureCell(user : User, isSelected: Bool) {
        self.avatarImage.image = user.avatar
        self.emailLbl.text = user.email
            if isSelected {
                self.checkImageView.isHidden = false
    
            }else {
                self.checkImageView.isHidden = true
          }
       
    }
    

}

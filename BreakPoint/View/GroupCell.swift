//
//  GroupCell.swift
//  BreakPoint
//
//  Created by lucas on 25/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    @IBOutlet weak var titreLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(groupe : Group) {
        self.titreLbl.text = groupe.title
        self.descLbl.text = groupe.desc
        self.membersLbl.text = "Membre \(groupe.members.count)"
    }

}

//
//  PopupViewController.swift
//  BreakPoint
//
//  Created by lucas on 20/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    @IBOutlet weak var messageLbl: UILabel!
    var message : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if message != nil {
             self.messageLbl.text = message
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissVeiw))
        tap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tap)
       
    }
    @IBAction func onClickClose(_ sender: Any) {
        self.dismissVeiw()
    }
    @objc func dismissVeiw()  {
        self.dismiss(animated: true, completion: nil)
    }
}

//
//  AUTHViewController.swift
//  BreakPoint
//
//  Created by lucas on 20/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit

class AUTHViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSignInFB(_ sender: Any) {
    }
    @IBAction func onClickSignInGooglePlus(_ sender: Any) {
    }
    
    @IBAction func onClickSignInEmail(_ sender: Any) {
        self.performSegue(withIdentifier: "ploginVC", sender: nil)
    }
}

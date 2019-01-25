//
//  AUTHViewController.swift
//  BreakPoint
//
//  Created by lucas on 20/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit
import Firebase

class AUTHViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
          self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func onClickSignInFB(_ sender: Any) {
    }
    @IBAction func onClickSignInGooglePlus(_ sender: Any) {
    }
    
    @IBAction func onClickSignInEmail(_ sender: Any) {
        self.performSegue(withIdentifier: "ploginVC", sender: nil)
    }
}

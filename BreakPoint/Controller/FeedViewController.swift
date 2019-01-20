//
//  FeedViewController.swift
//  BreakPoint
//
//  Created by lucas on 20/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onClickShowVC(_ sender: Any) {
        self.performSegue(withIdentifier: "postVC", sender: nil)
    }
    
}

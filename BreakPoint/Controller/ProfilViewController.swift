//
//  ProfilViewController.swift
//  BreakPoint
//
//  Created by lucas on 20/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit
import Firebase

class ProfilViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var avatarProfilImageView: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    override func viewDidAppear(_ animated: Bool) {
        emailLbl.text = Auth.auth().currentUser?.email
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    @IBAction func onClickLogOut(_ sender: Any) {
        let alertVC = UIAlertController(title: "Logout", message: "Are you sure you want to logout", preferredStyle: UIAlertControllerStyle.actionSheet)
        let btnAction = UIAlertAction(title: "Deconnecter", style: UIAlertActionStyle.destructive) { (action) in
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "authVC") as? AUTHViewController
                self.present(authVC!, animated: true, completion: nil)
            }catch {
                print(error)
            }
        }
        
        alertVC.addAction(btnAction)
        present(alertVC, animated: true, completion: nil)
    }
}

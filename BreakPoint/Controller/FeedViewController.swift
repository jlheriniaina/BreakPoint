//
//  FeedViewController.swift
//  BreakPoint
//
//  Created by lucas on 20/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit
import Firebase


class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    private var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.loadMessage()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    @IBAction func onClickShowVC(_ sender: Any) {
        self.performSegue(withIdentifier: "postVC", sender: nil)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedCell
        let message = messages[indexPath.row]
        DataService.instance.getUsername(forUID: message.uid) { (email) in
              cell.configureCell(avatar: #imageLiteral(resourceName: "defaultProfileImage"), email: email, message: message)
        }
        return cell
    
    }
    func loadMessage() {
        DataService.instance.REF_FEED.observeSingleEvent(of: .value) { (snapshot) in
            guard let feeds = snapshot.children.allObjects as? [DataSnapshot] else { return }
            for feed in feeds {
                let id = feed.key
                let content = feed.childSnapshot(forPath: "content").value as! String
                let  uid = feed.childSnapshot(forPath: "senderUid").value as! String
                let message = Message(id: id, content: content, uid: uid)
                self.messages.append(message)
                self.tableView.reloadData()
                }
               
            }
        
    }
}

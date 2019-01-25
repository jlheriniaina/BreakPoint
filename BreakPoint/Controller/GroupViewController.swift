//
//  SecondViewController.swift
//  BreakPoint
//
//  Created by lucas on 20/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit
import Firebase

class GroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    private var groups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.loadGroupes()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell {
            cell.configureCell(groupe: groups[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    func loadGroupes() {
        DataService.instance.REF_GROUPS.observeSingleEvent(of: DataEventType.value) { (dataSnapshot) in
            guard let groupeArray = dataSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for group in groupeArray {
                let title = group.childSnapshot(forPath: "title").value as! String
                let desc = group.childSnapshot(forPath: "description").value as! String
                let memb = group.childSnapshot(forPath: "members").value as! [String]
                self.groups.append(Group(titre: title, desc: desc, membre: memb))
                self.tableView.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}


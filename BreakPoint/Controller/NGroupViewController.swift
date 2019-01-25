//
//  NGroupViewController.swift
//  BreakPoint
//
//  Created by lucas on 22/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit
import Firebase

class NGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var titreTxtField: InsetRectTextField!
    @IBOutlet weak var descTxtField: InsetRectTextField!
    @IBOutlet weak var searchTxtField: InsetRectTextField!
    @IBOutlet weak var groupLbl: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var tableView: UITableView!
    private var users = [User]()
    private var stringArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchTxtField.delegate = self
        self.searchTxtField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        btnSave.isHidden = true
    }
   @objc func textFieldDidChange() {
        if searchTxtField.text == "" {
            users = []
            self.tableView.reloadData()
        }else {
            DataService.instance.getEmail(forQuery: searchTxtField.text!, handler: { (userList) in
                self.users = userList
                self.tableView.reloadData()
            })
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell {
            let user = users[indexPath.row]
            if stringArray.contains(user.email){
                cell.configureCell(user: user, isSelected: false)
                return cell
            }else {
                cell.configureCell(user: user, isSelected: true)
                return cell
            }
           
        }
       return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return  }
        if !stringArray.contains(cell.emailLbl.text!) {
            stringArray.append(cell.emailLbl.text!)
            groupLbl.text = stringArray.joined(separator: ", ")
            btnSave.isHidden = false
        }else {
           stringArray = stringArray.filter({$0 != cell.emailLbl.text!})
            if stringArray.count > 0 {
                groupLbl.text = stringArray.joined(separator: ", ")
                
            }else {
                groupLbl.text = "Nouvelle group"
                btnSave.isHidden = true
            }
        }
        
    }
    @IBAction func onClickDissmis(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func onClickSave(_ sender: Any) {
        btnSave.isHidden = false
        print("ffffffff")
        if titreTxtField.text != "" && descTxtField.text != "" {
            
            DataService.instance.getIDS(username: self.stringArray, handler: { (uiData) in
                var uid = uiData
                uid.append((Auth.auth().currentUser?.uid)!)
                DataService.instance.createGroup(title: self.titreTxtField.text!, desc: self.descTxtField.text!, uid: uid, handler: { (status) in
                    if status {
                        self.dismiss(animated: true, completion: nil)
                    }else {
                        print("Goup do not created")
                    }
                })
            })
        }
    }
    
}

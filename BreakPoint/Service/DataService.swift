//
//  DataService.swift
//  BreakPoint
//
//  Created by lucas on 20/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import UIKit

public class DataService {
    public static let instance = DataService()
    public static let DB_BASE = Database.database().reference()
    
    private var _REF_USER = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    private init(){}
    
    var REF_USER : DatabaseReference {
        return _REF_USER
    }
    
    var REF_GROUPS : DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED : DatabaseReference {
        return _REF_FEED
    }
    
    func createUser(uid: String, user: Dictionary<String, Any>) {
        REF_USER.child(uid).updateChildValues(user)
    }
    func uploadPost(message: String, uid: String, groupKey: String?, complete: CompleteSucces?) {
        if groupKey != nil {
            
        }else {
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderUid": uid])
            complete!(true)
        }
    }
    func getUsername(forUID uid: String, handler: @escaping (_ username: String) -> ()) {
        REF_USER.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    func getEmail(forQuery: String, handler: @escaping (_ emailList : [User]) -> ()) {
        var users = [User]()
        REF_USER.observe(DataEventType.value) { (snapshot) in
            guard let userSnapishot = snapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapishot {
                let email = user.childSnapshot(forPath: "email").value as! String
                if email.contains(forQuery) == true && email != Auth.auth().currentUser?.email {
                    let user = User(id: user.key, email: email, avatar: #imageLiteral(resourceName: "defaultProfileImage"))
                    users.append(user)
                }
            }
            handler(users)
        }
    }
    func getIDS(username: [String], handler: @escaping (_ uid : [String]) ->()) {
        
        REF_USER.observeSingleEvent(of: DataEventType.value) { (snapshots) in
            var arrayList = [String]()
            
            guard let users = snapshots.children.allObjects as? [DataSnapshot] else { return }
            for user in users {
                print(user)
                let email = user.childSnapshot(forPath: "email").value as! String
                if username.contains(email){
                    arrayList.append(user.key)
                }
            }
            handler(arrayList)
        }
    }
    func createGroup(title : String, desc: String, uid: [String], handler: @escaping (_ status: Bool) -> ()){
        REF_GROUPS.childByAutoId().updateChildValues(["title": title, "description": desc, "members": uid])
        handler(true)
    }
}

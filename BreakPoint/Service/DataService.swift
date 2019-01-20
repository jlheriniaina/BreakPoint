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
    
    
}

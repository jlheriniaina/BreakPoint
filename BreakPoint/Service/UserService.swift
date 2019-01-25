//
//  UserService.swift
//  BreakPoint
//
//  Created by lucas on 20/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import Foundation
import Firebase

public class UserService {
    public static let instance = UserService()
    var users = [User]()
    
    private init(){}
    
    func registerUser(email: String, password: String, completion: CompletionResult?) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                completion!(false, error)
                return
            }
            let data = ["provider": user.user.providerID, "email": user.user.email]
            print(data)
            DataService.instance.createUser(uid: user.user.uid, user: data)
            completion!(true, nil)
        }
    }
    func login(email: String, password: String, complete: CompletionResult?) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                complete!(false, error)
                return
            }
            complete!(true,nil)
        }
    }
    
}

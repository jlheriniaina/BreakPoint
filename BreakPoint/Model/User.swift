//
//  User.swift
//  BreakPoint
//
//  Created by lucas on 21/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import Foundation
import UIKit

class User {
    private var _id: String!
    private var _emeil: String!
    private var _avatar: UIImage!
    
    
    var avatar : UIImage {
        return _avatar
    }
    
    var id: String {
        return _id
    }
    var email: String {
        return _emeil
    }

    init(id: String, email: String, avatar: UIImage) {
        self._id = id
        self._emeil = email
        self._avatar = avatar
    }
    
    
}

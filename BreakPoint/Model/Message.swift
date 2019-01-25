//
//  Message.swift
//  BreakPoint
//
//  Created by lucas on 21/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import Foundation


class Message {
    private var _id: String!
    private var _content: String!
    private var _uid: String!
    
    var id : String {
        return _id
    }
    var content: String {
        return _content
    }

    var uid: String {
        return _uid
    }
    
    init(id: String, content: String, uid: String) {
        self._id = id
        self._content = content
        self._uid = uid
    }
   
    
    
    
}

//
//  Group.swift
//  BreakPoint
//
//  Created by lucas on 25/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import Foundation

class Group {
    
    private var _title: String!
    private var _desc: String!
    private var _members: [String]!
    
    var title: String {
        return _title
    }
    var desc: String {
        return _desc
    }
    var members: [String] {
        return _members
    }
    
    init(titre: String, desc: String, membre: [String]) {
        self._title = titre
        self._desc = desc
        self._members = membre
    }
    
    
}

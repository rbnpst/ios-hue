//
//  Place.swift
//  ios-hue
//
//  Created by Robin on 28/09/2017.
//  Copyright © 2017 Robin. All rights reserved.
//

import Foundation

class Place {
    var name : String?
    var hostname : String?
    var username : String?
    
    init(name: String, hostname: String, username: String) {
        self.name = name
        self.hostname = hostname
        self.username = username
    }
}

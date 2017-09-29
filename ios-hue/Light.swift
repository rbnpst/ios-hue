//
//  Light.swift
//  ios-hue
//
//  Created by Robin on 28/09/2017.
//  Copyright © 2017 Robin. All rights reserved.
//

import Foundation

class Light {
    var name : String?
    var on : Bool?
    
    let hue = HueAPI()
    
    func toggleLight(on: Bool, url: String) {
        let parameters = ["on": on]
        hue.request(url: url, parameters: parameters, method: .put)
        self.on = on
    }
}

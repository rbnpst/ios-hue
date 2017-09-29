//
//  HueAPI.swift
//  ios-hue
//
//  Created by Robin on 28/09/2017.
//  Copyright © 2017 Robin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HueAPI {
    
    func request(url: String, parameters: [String:Any], method: HTTPMethod) {
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (responseData) -> Void in
            if ((responseData.result.value) != nil) {
                let results = JSON(responseData.result.value!)
                print("Reponse\(results)")
            }
        }
    }
    
    func requestLights(url: String, username: String, completion: @escaping (Array<Light>) -> Void) {
        var lights : [Light] = []
        let url = "\(url)\(username)/lights"
        Alamofire.request(url, method: .get, encoding: URLEncoding.default).responseJSON { (responseData) -> Void in
            if ((responseData.result.value) != nil) {
                let results = JSON(responseData.result.value!)
                print("Response\(results)")
                
                for (key, result) in results {
                    let light = Light()
                    let id = String(key)
                    let name = result["name"].string
                    let on = result["state"]["on"].bool
                    
                    light.name = name
                    light.on = on
                    
                    lights.append(light)
                }
                completion(lights)
            }
        }
    }
    
}

//
//  LightTableViewCell.swift
//  ios-hue
//
//  Created by Robin on 28/09/2017.
//  Copyright © 2017 Robin. All rights reserved.
//

import UIKit

class LightTableViewCell: UITableViewCell {

    @IBOutlet weak var labelLightName: UILabel!
    @IBOutlet weak var switchLightOn: UISwitch!
    
    var lightId : String = ""
    var hostname : String = ""
    var username : String = ""
    
    @IBAction func onSwitchEvent(_ sender: Any) {
        let light = Light()
        print("\(hostname)\(username)/lights/\(lightId)/state/")
        if switchLightOn.isOn {
            light.toggleLight(on: true, url: "\(hostname)\(username)/lights/\(lightId)/state/")
        } else {
            light.toggleLight(on: false, url: "\(hostname)\(username)/lights/\(lightId)/state/")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

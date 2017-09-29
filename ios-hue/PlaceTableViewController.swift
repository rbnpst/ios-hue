//
//  PlaceTableViewController.swift
//  ios-hue
//
//  Created by Robin on 28/09/2017.
//  Copyright © 2017 Robin. All rights reserved.
//

import UIKit

class PlaceTableViewController: UITableViewController {
    
    var places : [Place] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        places.append(Place(name: "Emulator", hostname: "http://192.168.178.16:8000/api/", username: "newdeveloper"))
        places.append(Place(name: "LD134", hostname: "http://192.168.1.179/api/", username: "iXNmJxbOS1lYsdE2ug6sOmdGrPe1cyill6Y7TPM2"))
        
//        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeIndentifier", for: indexPath) as! PlaceTableViewCell

        cell.labelPlace.text = places[indexPath.row].name

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lightsOverviewSegue" {
            if let destination = segue.destination as? LightTableViewController {
//                if let index = self.tableView.indexPathForSelectedRow {
//                    let place = self.places[(index as NSIndexPath).row]
//                    destination.hostname = place.hostname!
//                    destination.username = place.username!
//                }
                let index = self.tableView.indexPathForSelectedRow?.row
                let place = self.places[index!]
                destination.place = place
            }
        }
    }

}

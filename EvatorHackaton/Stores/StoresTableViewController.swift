//
//  StoresTableViewController.swift
//  EvatorHackaton
//
//  Created by user name on 30/11/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

final class StoresTableViewController: UITableViewController {

    private var dataProvider:DataProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataProvider = StoresDataProvider()                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.storeCell, for: indexPath)
        cell.selectionStyle = .none
        if let model = self.dataProvider?.getData()?[indexPath.row] as? StoresModel {
            let distanceLabel = cell.viewWithTag(1) as! UILabel
            distanceLabel.text = model.distance
            let storeNameLabel = cell.viewWithTag(2) as! UILabel
            storeNameLabel.text = model.storeName
            let addressLabel = cell.viewWithTag(3) as! UILabel
            addressLabel.text = model.address
            let workTimeLabel = cell.viewWithTag(4) as! UILabel
            workTimeLabel.text = model.workTime
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

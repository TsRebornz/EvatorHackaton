//
//  GoodsTableViewController.swift
//  EvatorHackaton
//
//  Created by user name on 29/11/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

class GoodsTableViewController: UITableViewController {

    private var dataProvider:DataProvider?
    var categoryId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: Constants.goodsCell)
        self.dataProvider = GoodsTableDataProvider()        
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
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.goodsCell, for: indexPath) as? GoodsTableViewCell
        if let model = self.dataProvider?.getData()?[indexPath.row] as? GoodsTableCellModel {
            cell?.setCellModel(model:model as AnyObject)
        }
        return cell!
    }
    
    //MARK: Actions

    @IBAction func returnButtonTapped(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func plusTapped(_ sender: UITableViewCell) {
        sender.viewWithTag(6)
    }
    
    @objc func minusTapped(_ sender: UITableViewCell) {
        sender.viewWithTag(6)
    }
    
    //MARK:
    

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
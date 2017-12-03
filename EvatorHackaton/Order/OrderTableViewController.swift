//
//  OrderViewController.swift
//  EvatorHackaton
//
//  Created by username on 03/12/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit


final class OrderTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    private var dataProvider:DataProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataProvider = OrderDataProvider()
        self.dataProvider?.getData()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _cellModels = self.dataProvider?.cellModels {
            return _cellModels.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.orderCell, for: indexPath) as? OrderModelTableViewCell
        if let model = self.dataProvider?.getData()?[indexPath.row] as? OrderModel {
            cell?.setCellModel(model:model as AnyObject)
        }
        return cell!
    }
    
    //MARK:
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

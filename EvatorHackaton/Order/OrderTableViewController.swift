//  OrderViewController.swift
//  EvatorHackaton
//  Created by username on 03/12/2017.
//  Copyright © 2017 TM. All rights reserved.

import UIKit

extension OrderTableViewController: DataUpdated {
    func dataUpdated(data: AnyObject) {
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

final class OrderTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
        
    private var dataProvider:DataProvider?
    var refreshControl: UIRefreshControl! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareRefreshControl()
        self.dataProvider = OrderDataProvider()
        (self.dataProvider as? OrderDataProvider)?.delegate = self
        //self.tableView.select
        
        //Data
        self.refreshControl.beginRefreshing()
        
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
        if let model = self.dataProvider?.cellModels[indexPath.row] as? OrderModel {
            cell?.setCellModel(model: model as AnyObject)
        }
        return cell!
    }
    
    //MARK:
    
    //MARK: Refresh Control
    private func prepareRefreshControl() {
        let refreshControl = UIRefreshControl()
        //refreshControl.tintColor = AppearenceColors.defaultText
        self.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = refreshControl
        } else {
            self.tableView.backgroundView = refreshControl
        }
        
    }
    
    func refresh(_ refreshControl: UIRefreshControl) {
        refreshControl.beginRefreshing()
        (self.dataProvider as! OrderDataProvider).updateOrders()
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

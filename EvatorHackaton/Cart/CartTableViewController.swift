//
//  CartTableViewController.swift
//  EvatorHackaton
//
//  Created by username on 02/12/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

extension CartTableViewController: GoodTableViewCellDelegate {
    func priceChanged() {
        self.updateAllPrice()
    }
}

final class CartTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var dataProvider:DataProvider?
    fileprivate var cartOrderDataProvider: CartOrderDataProvider!
    
    @IBOutlet weak var orderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addVisuals()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.dataProvider = CartDataProvider()
        //self.dataProvider?.getData()
        self.cartOrderDataProvider = CartOrderDataProvider()
        self.updateAllPrice()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.dataProvider?.getData()
        self.tableView.reloadData()
        self.updateAllPrice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cartCell, for: indexPath) as? CartTableViewCell
        if let model = self.dataProvider?.cellModels[indexPath.row] as? CartModel {
            cell?.delegate = self
            cell?.setCellModel(model:model as AnyObject)
        }
        return cell!
    }
    
    //MARK: Inner logic
    fileprivate func updateAllPrice() {
        self.cartOrderDataProvider.createOrUpdateOrder()
        let allPrice = self.cartOrderDataProvider.getPrice()
        self.orderButton.setTitle(Constants.makeOrderButtonText + " " + "\(allPrice)Р", for: .normal)
    }
    
    //MARK:
    
    //MARK: Actions
    
    @IBAction func orderButtonTapped(_ sender: Any) {
        self.cartOrderDataProvider?.saveAndSendOrderToEvator()
    }
    
    //MARK:
    
    //MARK: Visual
    private func addVisuals() {
        let plusButtonLayer = orderButton.layer
        self.setButtonLayerVisuals(buttonLayer: plusButtonLayer)
    }
    
    private func setButtonLayerVisuals(buttonLayer: CALayer) {
        buttonLayer.borderColor = orderButton.tintColor.cgColor
        buttonLayer.borderWidth = 0.5
        buttonLayer.cornerRadius = 10
    }
    //MARK:
    
}

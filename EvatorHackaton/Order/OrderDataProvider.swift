//  OrderDataProvider.swift
//  EvatorHackaton
//  Created by username on 02/12/2017.
//  Copyright © 2017 TM. All rights reserved.
import UIKit

final class OrderDataProvider: NSObject, DataProvider {
    var orders: [OrderModel] = []
    var cellModels: [AnyObject] { get { return orders as [AnyObject] } }
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    weak var delegate: DataUpdated?
    
    @discardableResult
    func getData() -> [AnyObject]? {
        getDataFromMemmory()
        saveAndSendOrderToEvator()
        return nil
    }
    
    func getDataFromMemmory() {
        self.orders = appDelegate.getOrders()
    }
    
    func saveAndSendOrderToEvator() {
        let apiClient = ApiClient()
        let orderToSend = self.appDelegate.getNotSendedOrder()
        let parameters: NSDictionary = orderToSend.toDictionary()
        
        apiClient.sendOrders(parameters: parameters, handler: {json in
            if let order = OrderModel.createModel(fromJson: json) {
                self.orders.append(order)
                self.delegate?.dataUpdated(data: self.cellModels as AnyObject)
//                DispatchQueue.main.async {
//                    self.appDelegate.addOrder(byModel: order)
//                    self.getDataFromMemmory()
//                    
//                }
            }
        })
    }
    
    func updateOrders() {
        let apiClient = ApiClient()
        apiClient.getOrders(handler: { json in
            let orders = json as? [String: Any]
            for jsonOrder in orders! {
                if let order = OrderModel.createModel(fromJson: jsonOrder) {
                    self.orders.append(order)
                }
            }
            self.delegate?.dataUpdated(data: self.cellModels as AnyObject)
//            DispatchQueue.main.async {
//                self.getDataFromMemmory()
//                
//            }
        })
    }
}

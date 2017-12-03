//
//  OrderDataProvider.swift
//  EvatorHackaton
//
//  Created by username on 02/12/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

final class OrderDataProvider: NSObject, DataProvider {
    var orders: [OrderModel] = []
    var cellModels: [AnyObject] { get { return orders as [AnyObject] } }
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @discardableResult
    func getData() -> [AnyObject]? {
        self.orders = appDelegate.getOrders()
        return cellModels
    }
    
}

//
//  CartDataProvider.swift
//  EvatorHackaton
//
//  Created by username on 02/12/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

final class CartDataProvider: NSObject, DataProvider {
    var cartModels: [CartModel] = []
    var cellModels: [AnyObject] { get { return cartModels as [AnyObject] } }
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @discardableResult
    func getData() -> [AnyObject]? {
        self.cartModels = appDelegate.getCarts()
        return cellModels as? [AnyObject]
    }
}

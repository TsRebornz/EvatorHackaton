//
//  OrderModel.swift
//  EvatorHackaton
//
//  Created by username on 02/12/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import Foundation

struct OrderModel {
    var statusId: Int?
    let itemCount: Int
    let price: Int
    let goods: [CartModel]
    let statusNum: Int?
    
    func toDictionary() -> NSDictionary {
        var dicitionary = [
            "price": self.price,
            "itemsCount": self.itemCount,
            "items": []                        
        ] as [String : Any]
        
        var cartDictinaryArr: [[String:Any]] = []
        for cartModel in self.goods {
            let cartDictionary = cartModel.toDictionary()
            cartDictinaryArr.append(cartDictionary as! [String : Any])
        }
        dicitionary["items"] = cartDictinaryArr
        return dicitionary as NSDictionary
    }
    
    static func createModel(fromJson json: Any) -> OrderModel? {
        if let dictionary = json as? [String: Any] {
            guard let id = dictionary["id"] as? Int,
                let price = dictionary["price"] as? Int,                
                let status = dictionary["status"] as? Int,
                let items = dictionary["items"] as? [[String: Any]],
                let itemsCount = items.count as? Int
            else
            {
                return nil
            }
            let orderModel = OrderModel(statusId: id, itemCount: itemsCount, price: price, goods: [], statusNum: status)
            return orderModel
        }
        return nil
    }
}

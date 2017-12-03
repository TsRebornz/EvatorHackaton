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
    let statusNum: Int = 1
    
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
}

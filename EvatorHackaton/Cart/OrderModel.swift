//
//  OrderModel.swift
//  EvatorHackaton
//
//  Created by username on 02/12/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import Foundation

struct OrderModel {
    let id: Int
    let itemCount: Int
    let price: Int
    let goods: [CartModel]
    
    func toDictionary() -> NSDictionary {
        return [
            "price": self.price,
            "itemsCount": self.itemCount,
            "items": []                        
        ]
    }
}

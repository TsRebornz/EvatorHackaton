//
//  CartModel.swift
//  EvatorHackaton
//
//  Created by username on 02/12/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import Foundation

struct CartModel {
    let id: Int
    let imageName: String
    let itemName: String
    let price: Int
    var itemCount: Int
    
    /*
     
     {
         "name": "Батон",
         "quantity": 1,
         "price": 25.0,
         "uuid": "42c151a8-b22b-4cd5-b103-21bdb882e489"
     }
 
    */
    
    func toDictionary() -> NSDictionary {
        return [
            "name": itemName,
            "quantity": itemCount,
            "price": price,
            "uuid": Constants.uuid
        ]
    }
}

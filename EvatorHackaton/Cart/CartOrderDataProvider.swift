//
//  CartOrderDataProvider.swift
//  EvatorHackaton
//
//  Created by username on 02/12/2017.
//  Copyright © 2017 TM. All rights reserved.

import UIKit

final class CartOrderDataProvider: NSObject {
    var currentOrderInCart: OrderModel!
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getPrice() -> Int {
        createOrUpdateOrder()
        return currentOrderInCart.price
    }
    
    func createOrUpdateOrder() {
        var id = 0
        var overAllPrice = 0
        var arrayOfGoods: [CartModel] = []
        let cartModels = appDelegate.getCarts()
        
        for cartModel in cartModels {
            overAllPrice += cartModel.price * cartModel.itemCount
            id = id ^ cartModel.id ^ cartModel.itemCount
            arrayOfGoods.append(cartModel)
        }
        
        let orderModel = OrderModel(statusId: nil, itemCount: cartModels.count, price: overAllPrice, goods: cartModels, statusNum: nil)
        self.currentOrderInCart = orderModel
    }
    
    func saveToNotSendedOrder() {
        self.appDelegate.addNotSendedOrder(model: currentOrderInCart)
    }
    
}

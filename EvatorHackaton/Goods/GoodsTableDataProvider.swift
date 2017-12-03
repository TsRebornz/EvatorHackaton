//
//  GoodsTableDataProvider.swift
//  EvatorHackaton
//
//  Created by user name on 29/11/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

final class GoodsTableDataProvider: NSObject, DataProvider {
    var goodsModels: [GoodsTableCellModel] = []
    var categoryId: Int = 1
    
    var cellModels: [AnyObject] { get { return self.goodsModels as [AnyObject] } }
    
    func getData() -> [AnyObject]? {
        var cellModel = GoodsTableCellModel(id: 51, categoryId: 1, goodsImageUrl:"0101_bananas",goodsName:"Бананы", price: 45)
        self.goodsModels.append(cellModel)
        cellModel = GoodsTableCellModel(id: 52, categoryId: 1, goodsImageUrl:"0102_oranges",goodsName:"Апельсины", price: 68)
        self.goodsModels.append(cellModel)
        cellModel = GoodsTableCellModel(id: 53, categoryId: 1, goodsImageUrl:"0103_apples",goodsName:"Яблоки", price: 53)
        self.goodsModels.append(cellModel)
        cellModel = GoodsTableCellModel(id: 54, categoryId: 1, goodsImageUrl:"0104_pears",goodsName:"Груши", price: 90)
        self.goodsModels.append(cellModel)
        cellModel = GoodsTableCellModel(id: 55, categoryId: 1, goodsImageUrl:"0105_kiwi",goodsName:"Киви", price: 114)
        self.goodsModels.append(cellModel)
        cellModel = GoodsTableCellModel(id: 56, categoryId: 2, goodsImageUrl:"0201_smetana",goodsName:"Сметана", price: 42)
        self.goodsModels.append(cellModel)
        
        
        if ((categoryId) != nil) {
            let filteredModels = goodsModels.filter({ model in
                model.categoryId == self.categoryId
            }) as [AnyObject]
            self.goodsModels = filteredModels as! [GoodsTableCellModel]
            return self.goodsModels as [AnyObject]
        } else {
            return self.goodsModels as [AnyObject]
        }
    }
}

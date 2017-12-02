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
    var categoryId: Int?
    
    var cellModels: [AnyObject] { get { return self.goodsModels as [AnyObject] } }
    
    func getData() -> [AnyObject]? {
        var cellModel = GoodsTableCellModel(id: 51, categoryId: 1, goodsImageUrl:"rose",goodsName:"Розы", price: 150)
        self.goodsModels.append(cellModel)
        cellModel = GoodsTableCellModel(id: 52, categoryId: 1, goodsImageUrl:"dahlias",goodsName:"Георгины", price: 120)
        self.goodsModels.append(cellModel)
        cellModel = GoodsTableCellModel(id: 53, categoryId: 1, goodsImageUrl:"tulips",goodsName:"Тюльпаны", price: 135)
        self.goodsModels.append(cellModel)
        cellModel = GoodsTableCellModel(id: 54, categoryId: 2, goodsImageUrl:"dahlias",goodsName:"Помидоры", price: 90)
        self.goodsModels.append(cellModel)
        cellModel = GoodsTableCellModel(id: 55, categoryId: 2, goodsImageUrl:"dahlias",goodsName:"Огурцы", price: 50)
        self.goodsModels.append(cellModel)
        cellModel = GoodsTableCellModel(id: 56, categoryId: 2, goodsImageUrl:"dahlias",goodsName:"Морковь", price: 45)
        self.goodsModels.append(cellModel)
        cellModel = GoodsTableCellModel(id: 57, categoryId: 3, goodsImageUrl:"dahlias",goodsName:"Апельсины", price: 87)
        self.goodsModels.append(cellModel)
        cellModel = GoodsTableCellModel(id: 58, categoryId: 3, goodsImageUrl:"dahlias",goodsName:"Яблоки", price: 56)
        self.goodsModels.append(cellModel)
        cellModel = GoodsTableCellModel(id: 59, categoryId: 3, goodsImageUrl:"dahlias",goodsName:"Бананы", price: 68)
        self.goodsModels.append(cellModel)
        
        if ((categoryId) != nil) {
            let filteredModels = goodsModels.filter({ model in
                model.categoryId == self.categoryId!
            }) as [AnyObject]
            self.goodsModels = filteredModels as! [GoodsTableCellModel]
            return self.goodsModels as [AnyObject]
        } else {
            return self.goodsModels as [AnyObject]
        }
    }
}

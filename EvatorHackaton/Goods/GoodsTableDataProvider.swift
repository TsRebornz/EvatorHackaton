//
//  GoodsTableDataProvider.swift
//  EvatorHackaton
//
//  Created by user name on 29/11/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

final class GoodsTableDataProvider: NSObject, DataProvider {
    var cellModels: [GoodsTableCellModel] = []
    
    func getData() -> [AnyObject]? {
        var cellModel = GoodsTableCellModel(goodsImageUrl:"rose",goodsName:"Розы")
        self.cellModels.append(cellModel)
        cellModel = GoodsTableCellModel(goodsImageUrl:"dahlias",goodsName:"Георгины")
        self.cellModels.append(cellModel)
        cellModel = GoodsTableCellModel(goodsImageUrl:"tulips",goodsName:"Тюльпаны")
        self.cellModels.append(cellModel)
        
        return cellModels as? [AnyObject]
    }
}

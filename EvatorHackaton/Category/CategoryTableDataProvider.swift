//
//  CategoryCollectionDataProvider.swift
//  EvatorHackaton
//
//  Created by user name on 28/11/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

final class CategoryTableDataProvider: NSObject, DataProvider {
    var cellModels: [CategoryTableCellModel] = []
    
    func getData() -> [AnyObject]? {
        var cellModel = CategoryTableCellModel(id: 1, categoryImageUrl:"flowers",categoryName:"Цветы")
        self.cellModels.append(cellModel)
        cellModel = CategoryTableCellModel(id: 2, categoryImageUrl:"vegetables",categoryName:"Овощи")
        self.cellModels.append(cellModel)
        cellModel = CategoryTableCellModel(id: 3, categoryImageUrl:"fruits",categoryName:"Фрукты")
        self.cellModels.append(cellModel)
        
        return cellModels as? [AnyObject]
    }
}

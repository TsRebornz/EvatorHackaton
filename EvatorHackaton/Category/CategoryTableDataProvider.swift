//
//  CategoryCollectionDataProvider.swift
//  EvatorHackaton
//
//  Created by user name on 28/11/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

final class CategoryTableDataProvider: NSObject, DataProvider {
    var categoryModels: [CategoryTableCellModel] = []
    
    var cellModels: [AnyObject] { get { return categoryModels as [AnyObject] } }
    
    func getData() -> [AnyObject]? {
        var cellModel = CategoryTableCellModel(id: 1, categoryImageUrl:"flowers",categoryName:"Цветы")
        self.categoryModels.append(cellModel)
        cellModel = CategoryTableCellModel(id: 2, categoryImageUrl:"vegetables",categoryName:"Овощи")
        self.categoryModels.append(cellModel)
        cellModel = CategoryTableCellModel(id: 3, categoryImageUrl:"fruits",categoryName:"Фрукты")
        self.categoryModels.append(cellModel)
        
        return categoryModels as? [AnyObject]
    }
}

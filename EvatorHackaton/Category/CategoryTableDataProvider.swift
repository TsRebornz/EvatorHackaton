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
        var cellModel = CategoryTableCellModel(id: 1, categoryImageUrl:"0100",categoryName:"Овощи и фрукты")
        self.categoryModels.append(cellModel)
        cellModel = CategoryTableCellModel(id: 2, categoryImageUrl:"0200",categoryName:"Молоко, сыр")
        self.categoryModels.append(cellModel)
        cellModel = CategoryTableCellModel(id: 3, categoryImageUrl:"0300",categoryName:"Бакалея, крупы")
        self.categoryModels.append(cellModel)
        cellModel = CategoryTableCellModel(id: 4, categoryImageUrl:"0400",categoryName:"Рыба")
        self.categoryModels.append(cellModel)
        cellModel = CategoryTableCellModel(id: 5, categoryImageUrl:"0500",categoryName:"Напитки")
        self.categoryModels.append(cellModel)
        
        return categoryModels as? [AnyObject]
    }
}

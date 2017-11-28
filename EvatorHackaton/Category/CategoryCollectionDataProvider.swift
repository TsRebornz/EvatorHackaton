//
//  CategoryCollectionDataProvider.swift
//  EvatorHackaton
//
//  Created by user name on 28/11/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit
import CategoryCollectionCellModel

protocol DataProvider {
    func getData() -> [AnyObject]?
}

final class CategoryCollectionDataProvider: NSObject, DataProvider {
    var cellModels: [CategoryCollectionCellModel] = []
    
    func getData() -> [AnyObject]? {
        var cellModel = CategoryCollectionCellModel(categoryImageUrl:"flowers",categoryName:"Цветы")
        self.cellModels.append(cellModel)
        cellModel = CategoryCollectionCellModel(categoryImageUrl:"vegetables",categoryName:"Овощи")
        self.cellModels.append(cellModel)
        cellModel = CategoryCollectionCellModel(categoryImageUrl:"fruits",categoryName:"Фрукты")
        
        return cellModels as? [AnyObject]
    }
}

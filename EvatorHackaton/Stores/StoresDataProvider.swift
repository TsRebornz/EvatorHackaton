//
//  StoresDataProvider.swift
//  EvatorHackaton
//
//  Created by user name on 30/11/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

final class StoresDataProvider: NSObject, DataProvider {
    var cellModels: [StoresModel] = []    
    func getData() -> [AnyObject]? {
        var cellModel = StoresModel(storeName: "Пятерочка", address: "ул.Петрова,д3,к.2", workTime: "Пн-Вс 12-22", distance: "1,4 км")
        self.cellModels.append(cellModel)
        cellModel = StoresModel(storeName: "Перекресток", address: "ул.Ленина,д4,к.1", workTime: "Пн-Вс 10-21", distance: "5 км")
        self.cellModels.append(cellModel)
        
        return cellModels as? [AnyObject]
    }
}

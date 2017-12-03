//
//  Protocols.swift
//  EvatorHackaton
//
//  Created by user name on 29/11/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import Foundation

protocol DataUpdated: class {
    func dataUpdated(data: AnyObject)
}

protocol DataProvider {
    func getData() -> [AnyObject]?
    var cellModels: [AnyObject] { get }
}

protocol GoodTableViewCellDelegate: class {
    func priceChanged()
}

protocol DataForCell {
    func setCellModel(model:AnyObject)
}

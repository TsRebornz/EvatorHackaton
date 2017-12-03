//
//  OrderModelTableViewCell.swift
//  EvatorHackaton
//
//  Created by username on 03/12/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

enum StatusEnum {
    case created, processed, ready
    
    var statusDescription: String {
        switch self {
        case .created:
            return "Создан"
        case .processed:
            return "Обработан"
        case .ready:
            return "Готов"
        }
    }
    
    var statusColor: UIColor {
        switch self {
        case .created:
            return UIColor(hex: "448AFF")
        case .processed:
            return UIColor(hex: "FF7800")
        case .ready:
            return UIColor(hex: "4CAF50")
        }
    }
    
    static func convertToEnum(byNum num: Int) -> StatusEnum {
        switch num {
        case 1:
            return StatusEnum.created
        case 2:
            return StatusEnum.processed
        case 3:
            return StatusEnum.ready
        default:
            return StatusEnum.created
        }
    }
    
}

final class OrderModelTableViewCell: UITableViewCell {    
    @IBOutlet weak var orderNum: UILabel!
    @IBOutlet weak var orderTime: UILabel!
    @IBOutlet weak var allPrice: UILabel!
    @IBOutlet weak var itemsCount: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //
    func setCellModel(model:AnyObject) {
        let model = model as! OrderModel
        //FIXME: Fix hardCode
        self.orderNum.text = "Заказ #56"
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        self.orderTime.text = "\(hour):\(minutes)"
        self.allPrice.text = "\(model.price)\(Constants.rubleChar)"
        let arrOfWords = [ "позиция", "позиции", "позиций", "позиций"]
        let word = Utilities.generateWord(with: model.itemCount, and: arrOfWords)
        self.itemsCount.text = "\(model.itemCount) \(word)"
        
        let statusEnum = StatusEnum.convertToEnum(byNum: model.statusNum)
        self.statusLabel.backgroundColor = statusEnum.statusColor
        self.statusLabel.text = statusEnum.statusDescription
    }

}

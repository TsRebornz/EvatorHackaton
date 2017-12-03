//
//  OrderModelTableViewCell.swift
//  EvatorHackaton
//
//  Created by username on 03/12/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

enum StatusEnum {
    case created, processed, ready, paid
    
    var statusDescription: String {
        switch self {
        case .created:
            return "Создан"
        case .processed:
            return "В работе"
        case .ready:
            return "Готов"
        case .paid:
            return "Оплачен"
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
        case .paid:
            return UIColor(hex: "00AF00")
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
        case 4:
            return StatusEnum.paid
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
        self.selectionStyle = .none
        statusLabel.layer.cornerRadius = 12
        statusLabel.layer.masksToBounds = true
        
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
        if let t_statusId = model.statusId {
            self.orderNum.text = "Заказ #\(t_statusId)"
        }
                
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        self.orderTime.text = "\(hour):\(minutes)"
        self.allPrice.text = "\(model.price)\(Constants.rubleChar)"
        let arrOfWords = [ "позиция", "позиции", "позиций", "позиций"]
        let word = Utilities.generateWord(with: model.itemCount, and: arrOfWords)
        self.itemsCount.text = "\(model.itemCount) \(word)"
        
        if let t_statusNum = model.statusNum {
            let statusEnum = StatusEnum.convertToEnum(byNum: t_statusNum)
            self.statusLabel.backgroundColor = statusEnum.statusColor
            self.statusLabel.text = statusEnum.statusDescription
        }        
    }

}

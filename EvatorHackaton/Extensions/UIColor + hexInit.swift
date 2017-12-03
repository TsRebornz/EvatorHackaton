//
//  UIColor + hexInit.swift
//  EvatorHackaton
//
//  Created by username on 03/12/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import Foundation

import Foundation
import UIKit

extension UIColor {
    
    /**
     Creates UIColor from hex string, for example. Hex string exmaple "fa1d0a"
     */
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
    static func convertUIColorToHex(uicolor:UIColor) -> String {
        func isNeedZero(str:String) -> Bool {
            if str.characters.count > 1 {
                return false
            } else {
                return true
            }
        }
        
        var components = uicolor.cgColor.components
        let rHex = String(format:"%2X", Int((components?[0])! * 255) ).replacingOccurrences(of: " ", with: "")
        let gHex = String(format:"%2X", Int((components?[1])! * 255) ).replacingOccurrences(of: " ", with: "")
        let bHex = String(format:"%2X", Int((components?[2])! * 255) ).replacingOccurrences(of: " ", with: "")
        return "#" +  ( isNeedZero(str: rHex) ? "0" : "" ) + "\(rHex)" + ( isNeedZero(str: gHex) ? "0" : "" ) + "\(gHex)" + ( isNeedZero(str: bHex) ? "0" : "" ) + "\(bHex)"
    }
    
}

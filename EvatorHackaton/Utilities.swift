//
//  Utilities.swift
//  EvatorHackaton
//
//  Created by username on 03/12/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import Foundation

//MARK: Склонение слов

class Utilities: NSObject {
    /**
     arrOfWords = [ позция, позиции 2-4 , позиций 5-9,0 ]
     */
    class func generateWord( with num: Int, and arrOfWords:[String] ) -> String {
        let tenValue = num % 100
        if 11..<15 ~= tenValue {
            return arrOfWords[2]
        }
        
        let lastNum = num % 10
        
        switch lastNum {
        case 1:
            return arrOfWords[0]
        case 2..<5:
            return arrOfWords[1]
        case 5..<10:
            return arrOfWords[2]
        case 0:
            return arrOfWords[2]
        default:
            return ""
        }
    }

    //MARK:
}

//
//  ViewController.swift
//  EvatorHackaton
//
//  Created by user name on 28/11/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

final class TestViewController: UIViewController {

    //curl -X POST http://seagle.pythonanywhere.com/order.json -H 'accept: application/json' -H 'content-type: application/json' -d '{          	  	"price": 650,"itemsCount": 10,"items": [{"name": "Розы"},{"name": "авыфа"}    	]}'
    
    let json: NSDictionary = [
        "price": 666,
        "itemsCount": 666,
        "items": [
            ["name": "Розы"],
            ["name": "Георгины"],
            ["name": "Тюльпан"]
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Action
    
    @IBAction func buttonTapped(_ sender: Any) {
        let apiClient = ApiClient()
        apiClient.reaquestExamaple(parameters: self.json)    }
    
    //MARK:

}


//
//  EvatorApi.swift
//  EvatorHackaton
//
//  Created by user name on 30/11/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

final class ApiClient: NSObject {
    let backEndOrderPostRequest = "https://seagle.pythonanywhere.com/order.json"
    //YYYY-MM-DDThh:mm[:ss[.uuuuuu]][+HH:MM|-HH:MM|Z]."
    //curl -X POST https://seagle.pythonanywhere.com/order.json -H 'accept: application/json' -H 'content-type: application/json' -d '{          	  	"price": 651,"itemsCount": 10,"created_date": "2017-12-02", "items": [{"name": "Розы"},{"name": "авыфа"}    	]}'
    //curl -X POST https://seagle.pythonanywhere.com/order.json -H 'accept: application/json' -H 'content-type: application/json' -d '{          	  	"price": 651,"itemsCount": 10, "items": [{"name": "Розы"},{"name": "авыфа"}    	]}'
    
    func reaquestExamaple(parameters:NSDictionary){
        let Url = String(format: backEndOrderPostRequest)
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = parameters
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch {
                    print(error)
                }
            }
            }.resume()
    }
    
}

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
    //class func getSO(doWithJson: @escaping ([String : AnyObject]?) -> Void)
    
    func sendOrders(parameters:NSDictionary, handler: @escaping (Any) -> Void){
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
                    handler(json)
                    print(json)
                }catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func getOrders(orderId: Int, handler: @escaping (Any) -> Void){
        let Url = String(format: "https://seagle.pythonanywhere.com/order/\(orderId).json")
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
                
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    handler(json)
                    print(json)
                }catch {
                    print(error)
                }
            }
            }.resume()
    }
    
}

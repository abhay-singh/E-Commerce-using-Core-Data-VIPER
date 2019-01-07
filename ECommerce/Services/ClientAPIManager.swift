//
//  APIProduct.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 05/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import UIKit

class ClientAPIManager: NSObject {

    func getDataWith(for URLEndPoint:String, completion: @escaping (Result<[String: AnyObject]>) -> Void) {
        guard let url = URL(
                string:URLEndPoint
            ) else {
                return completion(.Error("Invalid URL"))
            }

        URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard error == nil
                else {
                    return completion(.Error(error!.localizedDescription))
            }
            guard let data = data
                else {
                    return completion(.Error(error?.localizedDescription ?? "There are no new Items to show"))
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    completion(.Success(json))

                }
            } catch let error {

                return completion(.Error(error.localizedDescription))
            }
            }.resume()
    }



}

//
//  ConstantsAPI.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 05/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import Foundation
enum ConfigUrl {
    static let baseURL = "https://stark-spire-93433.herokuapp.com/"
    static let productsParamName = "json"
}

enum Result <T>{
    case Success(T)
    case Error(String)
}

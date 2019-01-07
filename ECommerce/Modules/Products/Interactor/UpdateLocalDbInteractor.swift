//
//  UpdateLocalDbInteractor.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 05/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import Foundation

class UpdateLocalDBInteractor:PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    // creating url from base url and parameter for url endPoint
    // this computed property will be initialize on use of it for url
    lazy var endPoint: String = {
        return "\(ConfigUrl.baseURL)\(ConfigUrl.productsParamName)"
    }()

    // calling data from REST API for Products information like categories, products, variatns,tax
    func fetchData() {
        let productAPIManager = ClientAPIManager()
        productAPIManager.getDataWith(for: endPoint) { (result) in
            switch result{
            case .Success(let data):
                self.presenter?.fetchSuccess(of: data as AnyObject)
            case .Error(let message):
                self.presenter?.FetchFailed(message: "Error:\(message)")
            }
        }
    }
    


}

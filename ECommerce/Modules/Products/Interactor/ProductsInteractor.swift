//
//  ProductsInteractor.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 05/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import Foundation

class ProductsInteractor: PresenterToInteractorProtocol {

    func fetchData() {
        
        do {
        let data = try CoreDataManager.sharedManager.managedObjectContext.fetch(Categories.fetchRequest())
            presenter?.fetchSuccess(of: data as AnyObject)
        } catch let error {
            print(error)
            presenter?.FetchFailed(message: "Unable to load data from local database")
        }
    }
    
    var presenter: InteractorToPresenterProtocol?



}

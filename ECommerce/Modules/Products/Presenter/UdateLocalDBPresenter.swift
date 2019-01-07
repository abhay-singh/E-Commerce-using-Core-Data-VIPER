//
//  UdateLocalDBPresenter.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 05/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import Foundation
import UIKit

class UpdateLocalDBPresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?

    var interactor: PresenterToInteractorProtocol?

    var router: PresenterToRouterProtocol?

    func startFetchingData() {

        interactor?.fetchData()
    }

    func showController(navigationController: UINavigationController) {

        router?.pushToProductScreen(navigationConroller:navigationController)
    }


}

extension UpdateLocalDBPresenter:InteractorToPresenterProtocol{
    func FetchFailed(message: String) {

    }

    func fetchSuccess(of data:AnyObject) {

        if let dictionary = data as? [String: Any] {

            if let categoriesArray = dictionary["categories"] as?[[String: Any]] {
                // access all category objects
                for catergory in categoriesArray {
                    // access all objects in array
                    print(catergory)
                    Categories.saveInCoreDataWith(data:catergory as [String : Any])
                }
            }// category test block ends

            if let rankingsArray = dictionary["rankings"] as? [[String:Any]]{
                // Access ranking from ranking objects of array
                for ranking in rankingsArray{
                    print(ranking)
                    if let products = ranking["products"] as? [[String:Any]]{
                        print(products)
                    }
                }
            }

        }

        self.showController(navigationController:UINavigationController())
     }

}

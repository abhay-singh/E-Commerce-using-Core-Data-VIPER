//
//  ProductsPresenter.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 05/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import Foundation
import UIKit

class ProductsPresenter: ViewToPresenterProtocol {

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

extension ProductsPresenter:InteractorToPresenterProtocol{
    func fetchSuccess<T>(of data: T) {

        view?.showData(dataArray: data as! Array<Products>)
    }
    
    func FetchFailed(message: String) {
        view?.showError()
    }

 




}

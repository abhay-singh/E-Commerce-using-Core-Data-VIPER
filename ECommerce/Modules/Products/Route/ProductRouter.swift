//
//  ProductRouter.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 05/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import Foundation
import UIKit

class ProductRouter:PresenterToRouterProtocol {
    static func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ProductViewController") as!ProductsViewController
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = ProductsPresenter()
        let interactor: PresenterToInteractorProtocol = ProductsInteractor()
        let router:PresenterToRouterProtocol = ProductRouter()

        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }




    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }


    func pushToProductScreen(navigationConroller: UINavigationController) {

    }

}

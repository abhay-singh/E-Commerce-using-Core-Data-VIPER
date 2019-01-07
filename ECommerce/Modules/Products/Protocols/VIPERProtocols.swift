//
//  ProductsProtocols.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 05/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{

    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}

    // get data from local Database
    func startFetchingData()
    func showController(navigationController:UINavigationController)

}


protocol PresenterToViewProtocol: class{
    func showData<T>(dataArray:Array<T>)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> UIViewController
    func pushToProductScreen(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchData()
}

protocol InteractorToPresenterProtocol: class {

    func fetchSuccess(of data:AnyObject)
    // show faild message either from local database or API response
    func FetchFailed(message:String)
}

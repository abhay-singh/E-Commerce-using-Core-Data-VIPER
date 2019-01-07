//
//  UpdateLocalDataViewController.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 05/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import UIKit

class UpdateLocalDataViewController: UIViewController {
    var presentor:ViewToPresenterProtocol?
    var productsArrayList:Array<String> = Array()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentor?.startFetchingData()
    }
}

extension UpdateLocalDataViewController:PresenterToViewProtocol{
    func showData<T>(dataArray: Array<T>) {
     
    }

    func showError() {
        
    }

    
}

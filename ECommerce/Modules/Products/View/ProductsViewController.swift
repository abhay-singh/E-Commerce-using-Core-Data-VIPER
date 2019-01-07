//
//  ProductsViewController.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 05/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    private let cellIdForCategory = "Categroy Cell"

    var presentor:ViewToPresenterProtocol?
    var categoriesArrayList:Array<Categories> = Array()

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentor?.startFetchingData()

    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showProductListSegue"{
            let categoryTableViewCell = sender as! CategoryCell
            let indexPath = self.tableView.indexPath(for: categoryTableViewCell)
            let categoryObjc:Categories = categoriesArrayList[(indexPath?.row)!]
            if categoryObjc.relatedProduct!.count > 0 {
                return true
            }
        }
        return false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductListSegue" {
            let productlistVC = segue.destination as! ProductListViewController
            let categoryTableViewCell = sender as! CategoryCell
            let indexPath = self.tableView.indexPath(for: categoryTableViewCell)
            let categoryObjc:Categories = categoriesArrayList[(indexPath?.row)!]

                let products = Array(categoryObjc.relatedProduct!)
                productlistVC.productsArrayList = Array(products) as! Array<Products>

        }
    }


}
extension ProductsViewController:PresenterToViewProtocol{
    func showData<T>(dataArray: Array<T>) {
        self.categoriesArrayList = dataArray as! Array<Categories>
         // here i am going to reload table view
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func showError() {
        // here need to show error or hide progress view

    }
}



extension ProductsViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoriesArrayList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdForCategory) as! CategoryCell
        cell.set(forCategoryInfo: self.categoriesArrayList[indexPath.row])
        return cell
    }



}

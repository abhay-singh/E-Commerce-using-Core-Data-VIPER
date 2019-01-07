//
//  ProductListViewController.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 08/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import UIKit

class ProductListViewController: UITableViewController {
    var productsArrayList:Array<Products> = Array()
    private let cellIdForProduct = "Product Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return productsArrayList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdForProduct, for: indexPath)
        let product = productsArrayList[indexPath.row]
        cell.textLabel!.text = product.name
        cell.detailTextLabel?.text = "Tax name: \(product.productsTaxs!.name) and value: \(product.productsTaxs!.taxValue)"
        return cell
    }


}

//
//  Products+CoreDataClass.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 07/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Products)
public class Products: NSManagedObject {

    public static func createProductEntityFrom(dictionary: [String: AnyObject]) -> Products? {
        let context = CoreDataManager.sharedManager.managedObjectContext
        if let productEntity = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context) as? Products{
            productEntity.id = dictionary["id"] as? Int64 ?? 0
            productEntity.name = dictionary["name"] as? String
            let dateAdded = dictionary["date_added"] as? String

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            if let date = dateFormatter.date(from: dateAdded!){
                productEntity.date_added = date as NSDate
            }
            
            // create sets of variants related product
            var variants:Set<Variants> = Set()

            // variants of product
            if let variantsArray = dictionary["variants"] as?[[String:Any]]{
                for variant in variantsArray{
                    if  let variantManagedObject = Variants.createVarientEntityFrom(dictionary: variant as [String : AnyObject]){
                        variants.insert(variantManagedObject)
                    }

                }
            }

            productEntity.variantsOfProduct = variants as NSSet

            // Tax information for products
            if let taxDic = dictionary["tax"] as? [String:Any]{

                if  let tax = Tax.createTaxEntityFrom(dictionary: taxDic as [String : AnyObject]){
                    productEntity.productsTaxs = tax
                }
            }

            return productEntity

        }
        return nil
    }

}
//yyyy-MM-dd hh:mm:ss.SSSS


//
//  Categories+CoreDataClass.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 07/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Categories)
public class Categories: NSManagedObject {

    public static func createCategoryEntityFrom(dictionary: [String: Any]) -> Categories? {
        
        let context = CoreDataManager.sharedManager.managedObjectContext
        if let categoryEntity = NSEntityDescription.insertNewObject(forEntityName: "Categories", into: context) as? Categories{
            categoryEntity.id = (dictionary["id"] as? Int64)!
            categoryEntity.name = dictionary["name"] as? String
            var categoryProducts:Set<Products> = Set()
            //get products from categories
            if let productsArray = dictionary["products"] as? [[String:Any]]{
                // get product objects of dictionary
                for product in productsArray{
                    if  let productManagedObject = Products.createProductEntityFrom(dictionary: product as [String : AnyObject]){
                        categoryProducts.insert(productManagedObject)
                    }
                }
            }
            categoryEntity.relatedProduct = categoryProducts as NSSet

            return categoryEntity
        }
        return nil
    }
        public static func saveInCoreDataWith(data: [String: Any]) {
            _ = self.createCategoryEntityFrom(dictionary:data)
            do {
                try CoreDataManager.sharedManager.managedObjectContext.save()
            } catch let error {
                print(error)
            }
        }

}

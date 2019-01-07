//
//  Variants+CoreDataClass.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 07/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Variants)
public class Variants: NSManagedObject {
    
    public static func createVarientEntityFrom(dictionary: [String: AnyObject]) -> Variants? {
        let context = CoreDataManager.sharedManager.managedObjectContext
        if let VariantEntity = NSEntityDescription.insertNewObject(forEntityName: "Tax", into: context) as? Variants{
            VariantEntity.id = (dictionary["id"] as? Int64)!
            VariantEntity.color = dictionary["color"] as? String
            VariantEntity.price = (dictionary["price"] as? Int64)!
            VariantEntity.size = (dictionary["size"] as? Int64)!

            return VariantEntity
        }
        return nil
    }
}

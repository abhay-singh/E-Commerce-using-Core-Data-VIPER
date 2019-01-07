//
//  Tax+CoreDataClass.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 07/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Tax)
public class Tax: NSManagedObject {
    public static func createTaxEntityFrom(dictionary: [String: AnyObject]) -> Tax? {
        let context = CoreDataManager.sharedManager.managedObjectContext
        if let taxEntity = NSEntityDescription.insertNewObject(forEntityName: "Tax", into: context) as? Tax{
            taxEntity.name = dictionary["name"] as? String
            taxEntity.taxValue = dictionary["value"] as? Double ?? 0
            return taxEntity
        }
        return nil
    }
}


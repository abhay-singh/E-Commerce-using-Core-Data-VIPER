//
//  Categories+CoreDataProperties.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 07/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }

    @NSManaged public var child_categories: String?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var relatedProduct: NSSet?

}

// MARK: Generated accessors for relatedProduct
extension Categories {

    @objc(addRelatedProductObject:)
    @NSManaged public func addToRelatedProduct(_ value: Products)

    @objc(removeRelatedProductObject:)
    @NSManaged public func removeFromRelatedProduct(_ value: Products)

    @objc(addRelatedProduct:)
    @NSManaged public func addToRelatedProduct(_ values: NSSet)

    @objc(removeRelatedProduct:)
    @NSManaged public func removeFromRelatedProduct(_ values: NSSet)

}

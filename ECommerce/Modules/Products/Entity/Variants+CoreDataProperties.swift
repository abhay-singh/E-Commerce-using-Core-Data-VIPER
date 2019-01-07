//
//  Variants+CoreDataProperties.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 07/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//
//

import Foundation
import CoreData


extension Variants {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Variants> {
        return NSFetchRequest<Variants>(entityName: "Variants")
    }

    @NSManaged public var color: String?
    @NSManaged public var id: Int64
    @NSManaged public var price: Int64
    @NSManaged public var size: Int64
    @NSManaged public var productRelatedVariants: NSSet?

}

// MARK: Generated accessors for productRelatedVariants
extension Variants {

    @objc(addProductRelatedVariantsObject:)
    @NSManaged public func addToProductRelatedVariants(_ value: Products)

    @objc(removeProductRelatedVariantsObject:)
    @NSManaged public func removeFromProductRelatedVariants(_ value: Products)

    @objc(addProductRelatedVariants:)
    @NSManaged public func addToProductRelatedVariants(_ values: NSSet)

    @objc(removeProductRelatedVariants:)
    @NSManaged public func removeFromProductRelatedVariants(_ values: NSSet)

}

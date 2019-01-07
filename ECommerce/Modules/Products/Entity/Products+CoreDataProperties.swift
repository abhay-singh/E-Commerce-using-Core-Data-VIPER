//
//  Products+CoreDataProperties.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 07/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var date_added: NSDate?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var productRanking: Ranking?
    @NSManaged public var productsTaxs: Tax?
    @NSManaged public var relatedToCategory: Categories?
    @NSManaged public var variantsOfProduct: NSSet?

}

// MARK: Generated accessors for variantsOfProduct
extension Products {

    @objc(addVariantsOfProductObject:)
    @NSManaged public func addToVariantsOfProduct(_ value: Variants)

    @objc(removeVariantsOfProductObject:)
    @NSManaged public func removeFromVariantsOfProduct(_ value: Variants)

    @objc(addVariantsOfProduct:)
    @NSManaged public func addToVariantsOfProduct(_ values: NSSet)

    @objc(removeVariantsOfProduct:)
    @NSManaged public func removeFromVariantsOfProduct(_ values: NSSet)

}

//
//  Ranking+CoreDataProperties.swift
//  ECommerce
//
//  Created by Abhay Singh Naurang on 07/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//
//

import Foundation
import CoreData


extension Ranking {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ranking> {
        return NSFetchRequest<Ranking>(entityName: "Ranking")
    }

    @NSManaged public var productId: Int64
    @NSManaged public var ranking: String?
    @NSManaged public var view_count: Int64
    @NSManaged public var rankingWiseProducts: Products?

}

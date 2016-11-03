//
//  Location+CoreDataProperties.swift
//  OutGo
//
//  Created by 胡贝妮 on 2016/11/3.
//  Copyright © 2016年 胡贝妮. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation

extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location");
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longtitude: Double
    @NSManaged public var date: Date?
    @NSManaged var placemark: CLPlacemark?

}

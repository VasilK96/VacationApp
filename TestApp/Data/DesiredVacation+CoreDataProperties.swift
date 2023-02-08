//
//  DesiredVacation+CoreDataProperties.swift
//  TestApp
//
//  Created by Vasil Karashev on 8.02.23.
//
//

import Foundation
import CoreData


extension DesiredVacation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DesiredVacation> {
        return NSFetchRequest<DesiredVacation>(entityName: "DesiredVacation")
    }

    @NSManaged public var about: String?
    @NSManaged public var hotel: String?
    @NSManaged public var imageName: String?
    @NSManaged public var location: String?
    @NSManaged public var money: Int64
    @NSManaged public var name: String?

}

extension DesiredVacation : Identifiable {

}

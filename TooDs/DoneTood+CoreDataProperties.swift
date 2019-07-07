//
//  DoneTood+CoreDataProperties.swift
//  TooDs
//
//  Created by Asem Okby on 5.07.2019.
//  Copyright © 2019 Asem Okby. All rights reserved.
//
//

import Foundation
import CoreData


extension DoneTood {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DoneTood> {
        return NSFetchRequest<DoneTood>(entityName: "DoneTood")
    }

    @NSManaged public var tood: String?

}

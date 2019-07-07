//
//  Tood+CoreDataProperties.swift
//  TooDs
//
//  Created by Asem Okby on 5.07.2019.
//  Copyright © 2019 Asem Okby. All rights reserved.
//
//

import Foundation
import CoreData


extension Tood {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tood> {
        return NSFetchRequest<Tood>(entityName: "Tood")
    }

    @NSManaged public var tood: String?

}

//
//  CompetitionLeague+CoreDataProperties.swift
//  4Sale
//
//  Created by Al-attar on 04/06/2023.
//
//

import Foundation
import CoreData


extension CompetitionLeague {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompetitionLeague> {
        return NSFetchRequest<CompetitionLeague>(entityName: "CompetitionLeague")
    }

    @NSManaged public var logoURL: String?
    @NSManaged public var leagueName: String?

}

extension CompetitionLeague : Identifiable {

}

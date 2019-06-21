//
//  Issues+CoreDataProperties.swift
//  
//
//  Created by Anshuman Singh on 6/21/19.
//
//

import Foundation
import CoreData


extension Issues {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Issues> {
        return NSFetchRequest<Issues>(entityName: "Issues")
    }

    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var comment_url: String?

}

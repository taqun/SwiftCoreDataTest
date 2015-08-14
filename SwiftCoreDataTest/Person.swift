//
//  Person.swift
//  
//
//  Created by taqun on 2015/08/14.
//
//

import Foundation
import CoreData

class Person: NSManagedObject {

    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var company: Company

}

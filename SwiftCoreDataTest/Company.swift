//
//  Company.swift
//  
//
//  Created by taqun on 2015/08/14.
//
//

import Foundation
import CoreData

class Company: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var people: NSMutableSet

}

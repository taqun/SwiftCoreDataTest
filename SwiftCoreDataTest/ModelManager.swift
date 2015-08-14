//
//  ModelManager.swift
//  SwiftCoreDataTest
//
//  Created by taqun on 2015/08/14.
//  Copyright (c) 2015年 envoixapp. All rights reserved.
//

import UIKit
import CoreData

class ModelManager: NSObject {
    
    static var sharedInstance: ModelManager = ModelManager()
    
    func createCompany(name: String) -> (Company) {
        let context = CoreDataManager.sharedInstance.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Company", inManagedObjectContext: context)!
        
        var company = Company(entity: entity, insertIntoManagedObjectContext: context)
        company.name = name
        
        return company
    }
    
    func createPerson(firstName: String, lastName: String) -> (Person) {
        let context = CoreDataManager.sharedInstance.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: context)!
        
        var person = Person(entity: entity, insertIntoManagedObjectContext: context)
        person.firstName = firstName
        person.lastName = lastName
        
        return person
    }
    
    func getPersonByCompany(company: Company) -> ([Person]) {
        let context = CoreDataManager.sharedInstance.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: context)!
        
        var request = NSFetchRequest()
        request.entity = entity
        request.predicate = NSPredicate(format: "company = %@", company)
        
        var sort = NSSortDescriptor(key: "firstName", ascending: true)
        request.sortDescriptors = [sort]
        
        var error: NSError? = nil
        
        if let results = context.executeFetchRequest(request, error: &error) as? [Person] {
            return results
        } else {
            return []
        }
    }
   
}

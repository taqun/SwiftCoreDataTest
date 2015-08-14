//
//  SwiftCoreDataTestTests.swift
//  SwiftCoreDataTestTests
//
//  Created by taqun on 2015/08/14.
//  Copyright (c) 2015年 envoixapp. All rights reserved.
//

import UIKit
import XCTest
import CoreData
import SwiftCoreDataTest

class SwiftCoreDataTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        CoreDataManager.sharedInstance.deleteContext()
        
        super.tearDown()
    }
    
    func testCreateCompany() {
        var company = ModelManager.sharedInstance.createCompany("Apple Inc.")
        XCTAssertNotNil(company)
    }
    
    func testCreatePerson() {
        var company = ModelManager.sharedInstance.createCompany("Apple Inc.")
        XCTAssertNotNil(company)
        
        var person1 = ModelManager.sharedInstance.createPerson("Jobs", lastName: "Steve")
        person1.company = company
        
        var person2 = ModelManager.sharedInstance.createPerson("Cook", lastName: "Tim")
        person2.company = company
        
        var people = ModelManager.sharedInstance.getPersonByCompany(company)
        XCTAssertEqual(people.count, 2)
        
        XCTAssertEqual(people[0].firstName, "Cook")
        XCTAssertEqual(people[1].firstName, "Jobs")
    }
}

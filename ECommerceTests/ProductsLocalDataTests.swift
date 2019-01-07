//
//  ProductsLocalDataTests.swift
//  ECommerceTests
//
//  Created by Abhay Singh Naurang on 05/01/19.
//  Copyright © 2019 Abhay Singh Naurang. All rights reserved.
//

import XCTest
import CoreData
@testable import ECommerce

class ProductsLocalDataTests: XCTestCase {
    /*creating a CoreDataStack object, we will use this object to test operations like insert, update & delete*/
    var coreDataManager: CoreDataManager!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
         coreDataManager = CoreDataManager.sharedManager
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    // MARK: Our Products Ecommerce data model cases

    /*this test case test for the proper initialization of CoreDataManager class :)*/
    func test_init_coreDataManager(){

        let instance = CoreDataManager.sharedManager
        /*Asserts that an expression is not nil.
         Generates a failure when expression == nil.*/
        XCTAssertNotNil( instance )
    }

    /*test if NSPersistentContainer(the actual core data stack) initializes successfully
     */
    func test_coreDataStackInitialization() {
        let coreDataStack = CoreDataManager.sharedManager.persistentStoreCoordinator

        /*Asserts that an expression is not nil.
         Generates a failure when expression == nil.*/
        XCTAssertNotNil( coreDataStack )
    }

    /*This test case inserts a person record*/
    func test_create_category() {



    }

    /*This test case fetches all person records*/
    func test_fetch_all_product() {
    }

    func test_remove_product() {

    }



    func test_update_product(){


    }

    /*test if all data is deleted from store*/
    func test_flushData() {
//        coreDataManager.flushData()
//
//        /*this test case passes if fetchAllPerson returns 0 objects*/ XCTAssertEqual(coreDataManager.fetchAllPersons()?.count, 0)
    }

}


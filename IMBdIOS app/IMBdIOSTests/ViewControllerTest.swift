//
//  ViewControllerTest.swift
//  IMBdIOSTests
//
//  Created by ChethanBhandarkar on 05/08/21.
//

import XCTest
@testable import IMBdIOS
class ViewControllerTest: XCTestCase {
    var systemUnderTest: ViewController!
    override func setUpWithError() throws {
        
       systemUnderTest = ViewController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    //test viewcontroller is loaded
    func test_vc_is_not_nil()
    {
        XCTAssertNotNil(systemUnderTest)
    }
    
    func test_search_controller_is_not_nil(){
        
        XCTAssertNotNil(systemUnderTest.searchController)
    }
    func test_search_appears()
    {
        
        systemUnderTest.searchBarSearchButtonClicked(systemUnderTest.searchController.searchBar)
       
    }
    
    func test_search_works()
    {
        systemUnderTest.searchController.searchBar.text = "India"
        systemUnderTest.searchBarSearchButtonClicked(systemUnderTest.searchController.searchBar)
        XCTAssertEqual(systemUnderTest.finalMovieDataList?.count, 0)
        
       
    }
    func test_vm_is_not_nil()
    {
        
     //   XCTAssertNotNil(systemUnderTest.searchController.searchBar.delegate)
        XCTAssertNotNil(systemUnderTest.vm)
    }
    
   
    
   

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

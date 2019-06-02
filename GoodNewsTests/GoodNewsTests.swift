//
//  GoodNewsTests.swift
//  GoodNewsTests
//
//  Created by MAC on 5/13/19.
//  Copyright © 2019 okechukwu Ibekwe. All rights reserved.
//

import XCTest
@testable import GoodNews

class GoodNewsTests: XCTestCase {
    
    var sut:NewsListViewController!
    
    override func setUp() {
        
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        let viewController =
            storyboard.instantiateViewController(
                withIdentifier: "NewsListViewController")
        sut = viewController as? NewsListViewController
        sut.loadViewIfNeeded()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_TableViewIsNotNilAfterViewDidload() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsListViewController")
        let sut = viewController as! NewsListViewController
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test_TableView_AfterViewDidLoad_isNotNil() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsListViewController")
        let sut = viewController as! NewsListViewController
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_LoadingView_SetsTableViewDataSource() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsListViewController")
        let sut = viewController as! NewsListViewController
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(sut.tableView.dataSource is NewsListDataProvider)
        }
    
    func test_LoadingView_SetsTableViewDelegate() {
        XCTAssertTrue(sut.tableView.delegate is NewsListDataProvider)
    }
    
   
    func test_LoadingView_DataSourceEqualDelegate() {
        XCTAssertEqual(sut.tableView.dataSource as? NewsListDataProvider,
                       sut.tableView.delegate as? NewsListDataProvider)
    }
    
    }


    

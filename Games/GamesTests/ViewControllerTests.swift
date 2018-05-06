//
//  ViewControllerTests.swift
//  GamesTests
//
//  Created by admin on 06/05/18.
//  Copyright © 2018 admin. All rights reserved.
//

import XCTest
@testable import Games

class ViewControllerTests: XCTestCase {
    
     var vc: ViewController?
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        XCTAssertNotNil(storyboard, "ViewController Storyboard does not exist")
        XCTAssertNotNil(vc, "ViewController is not loaded properly")
        XCTAssertNotNil(vc?.view, "ViewController view should not be nil")
    }
    
    func testViewDidLoad() {
        XCTAssert((vc?.responds(to: #selector(vc?.viewDidLoad)))!)
        XCTAssertNotNil(vc?.viewDidLoad())
    }
    
    func testTableViewDataSource() {
        XCTAssertNotNil(vc?.tableView.dataSource, "ViewController table view dataSource can't be nil")
    }
    
    func testDelegate() {
        XCTAssertNotNil(vc?.tableView.delegate, "ViewController table view delegate can't be nil")
    }
  
}

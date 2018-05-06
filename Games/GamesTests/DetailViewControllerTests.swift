//
//  DetailViewControllerTests.swift
//  GamesTests
//
//  Created by admin on 06/05/18.
//  Copyright © 2018 admin. All rights reserved.
//

import XCTest
@testable import Games

class DetailViewControllerTests: XCTestCase {
    
    var dvc: DetailViewController?
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        dvc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        XCTAssertNotNil(storyboard, "DetailViewController Storyboard does not exist")
        XCTAssertNotNil(dvc, "ViewController is not loaded properly")
        XCTAssertNotNil(dvc?.view, "ViewController view should not be nil")
    }
    
    func testViewDidLoad() {
        XCTAssert((dvc?.responds(to: #selector(dvc?.viewDidLoad)))!)
        XCTAssertNotNil(dvc?.viewDidLoad())
    }
    
    func testTableViewDataSource() {
        XCTAssertNotNil(dvc?.tableView.dataSource, "ViewController table view dataSource can't be nil")
    }
    
    func testDelegate() {
        XCTAssertNotNil(dvc?.tableView.delegate, "ViewController table view delegate can't be nil")
    }
    
}

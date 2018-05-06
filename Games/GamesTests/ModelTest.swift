//
//  ModelTest.swift
//  GamesTests
//
//  Created by admin on 06/05/18.
//  Copyright © 2018 admin. All rights reserved.
//

import XCTest
@testable import Games

class ModelTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testmodel() {
        XCTAssertNotNil(King(name: "king1", nameOfBattle: "Battle"))
        _ = King(name: "king1", nameOfBattle: "Battle").noOfGames
    }
    
    
}

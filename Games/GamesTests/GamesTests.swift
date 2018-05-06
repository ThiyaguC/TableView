//
//  GamesTests.swift
//  GamesTests
//
//  Created by admin on 06/05/18.
//  Copyright © 2018 admin. All rights reserved.
//
import XCTest
@testable import Games

class GamesTests: XCTestCase {
    
    var viewModel = ViewModel()
    var kingTest = King(name: "Thought",nameOfBattle: "battle" )
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
    
    func testupdateAttackerValue() {
        if let attack = viewModel.currentKing?.attack {
        let kingAttackValue = attack + 1
        viewModel.updateAttackerValue(attackStatus: "win")
        XCTAssertEqual(kingAttackValue, attack)
        }
    }
    
    func testupdateDefenderValue() {
        if let depend = viewModel.currentKing?.defend {
        let kingDefenderValue = depend + 1
        viewModel.updateDefenderValue(attackStatus: "loss")
        XCTAssertEqual(kingDefenderValue, depend)
        }
    }
    
    func testVictoryScoresValue() {
        if let victoryScores = viewModel.currentKing?.victoryScores {
        let kingvictoryScoresValue = victoryScores +  1
        viewModel.updateAttackerValue(attackStatus: "win")
        XCTAssertEqual(kingvictoryScoresValue,victoryScores)
        }
        if let score = viewModel.currentKing?.victoryScores  {
            viewModel.updateDefenderValue(attackStatus: "win")
            XCTAssertEqual(score,viewModel.currentKing?.victoryScores)
        }
        
    }
    
    func testDefenderScoresValue() {
        let kingvictoryScoresValue = kingTest.victoryScores +  1
        viewModel.updateDefenderValue(attackStatus: "loss")
        if let score = viewModel.currentKing?.victoryScores  {
           XCTAssertEqual(kingvictoryScoresValue,score)
        }
        
        if let score = viewModel.currentKing?.victoryScores  {
            viewModel.updateAttackerValue(attackStatus: "win")
            XCTAssertEqual(score,viewModel.currentKing?.victoryScores)
        }
    }
    
    func testupdateBattleValue() {
        let count = kingTest.listOfWar.count
        viewModel.updateBattleValue(battleName: "battle")
        if let arryCount = viewModel.currentKing?.listOfWar.count {
            XCTAssertEqual(count,arryCount)
        }
        
        let count1 =  kingTest.listOfWar.count + 1
        viewModel.updateBattleValue(battleName: "Battle1")
        if let arryCount = viewModel.currentKing?.listOfWar.count {
            XCTAssertEqual(count1,arryCount)
        }
    }
    
    func testnoOfItemsInSection() {
        let section = viewModel.noOfItemsInSection(section: 1)
        XCTAssertNotNil(section)
    }

}

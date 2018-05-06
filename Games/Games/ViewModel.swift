//
//  ViewModel.swift
//  Games
//
//  Created by admin on 05/05/18.
//  Copyright © 2018 admin. All rights reserved.
//


import UIKit

protocol UpdateAttackValueOfKing {
    func updateAttackerValue(attackStatus : String)
}
protocol UpdateDefenderValueOfKing {
    func updateDefenderValue(attackStatus : String)
}

class ViewModel: NSObject{
    
    //MARK: Varbiles
    var kingList: [King]?
    var currentKing: King?
    var kingDict: [String:King] = [:]
    
    //MARK: Intiate API calls
    func fetchData(completion:@escaping () -> ()) {
        APIHandler.sharedInstance.getData(completion: { [weak self] (dataArray) in
            self?.kingList = self?.setUpModel(data: dataArray)
            completion()
        })
    }
    
    //MARK: setUpModel
    func setUpModel (data: NSArray) -> [King] {
        for eachElement in data {
            let element = eachElement as! NSDictionary
            let attackerKey = element[StaticStrings.attacker.rawValue] as? String  ?? ""
            let defenderKey = element[StaticStrings.defender.rawValue] as? String ?? ""
            let attackStat = element[StaticStrings.outcome.rawValue] as? String  ?? ""
            let battleName = element[StaticStrings.nameOfBattle.rawValue] as? String  ?? ""
            
            //Parsing Battle
            if kingDict[attackerKey] == nil && attackerKey != "" {
                kingDict[attackerKey] = King(name: attackerKey, nameOfBattle: battleName)
            }
            
            if kingDict[defenderKey] == nil && defenderKey != "" {
                kingDict[defenderKey] = King(name: defenderKey, nameOfBattle: battleName)
            }
            
            // update existing model
            updateKingModel(attackKey: attackerKey,defendKey: defenderKey, attackStatus : attackStat)
            updateBattleValue(battleName: battleName)
            let ratingTuple = RatingUtility.calculateValue(attckRating: (kingDict[attackerKey]?.rating), dependRating: kingDict[defenderKey]?.rating,  attackStatus: attackStat )
            kingDict[attackerKey]?.rating = ratingTuple.0
            kingDict[defenderKey]?.rating = ratingTuple.1
        }
        return [King](kingDict.values)
    }
    
    //MARK: updateView methods
    func noOfItemsInSection(section: Int) -> Int {
        return kingList?.count ?? 0
    }
    
    //MARK: Helper Methods
    func updateBattleValue(battleName : String) {
        if let kinglistOfWar = (self.currentKing?.listOfWar.contains(battleName)) {
            if !kinglistOfWar {
                self.currentKing?.listOfWar.append(battleName)
            }
        }
    }
    func updateKingModel(attackKey: String,defendKey: String, attackStatus : String) {
        if !(kingDict[attackKey] == nil && kingDict[defendKey] == nil) {
            if kingDict[attackKey]?.kingName == attackKey {
                if let attackKing = kingDict[attackKey] {
                    self.currentKing = attackKing
                    updateAttackerValue(attackStatus: attackStatus)
                }
            }
            
            if kingDict[defendKey]?.kingName == defendKey {
                if let defendKing = kingDict[defendKey] {
                    self.currentKing = defendKing
                    updateDefenderValue(attackStatus: attackStatus)
                }
            }
        }
    }
}

extension ViewModel: UpdateAttackValueOfKing, UpdateDefenderValueOfKing {
   
    //MARK: protocol methods
    func updateAttackerValue(attackStatus: String) {
        currentKing?.attack += 1
        if let score = currentKing?.victoryScores {
            currentKing?.victoryScores = (attackStatus == "win") ? (score + 1) : score
        }
    }
    
    func updateDefenderValue(attackStatus : String) {
        currentKing?.defend += 1
        if let score = currentKing?.victoryScores {
            currentKing?.victoryScores = (attackStatus == "loss") ? (score + 1) : score
        }
    }
}




//
//  Created by admin on 06/05/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

class King {
    
    var kingName: String
    var attack: Int =  0
    var defend: Int = 0
    var victoryScores: Int = 0
    var rating: Double  = 400.0
    var listOfWar: [String] = []
    var noOfGames: Int {
        return attack + defend
    }
  
    required init(name: String, nameOfBattle: String) {
        self.kingName = name
        self.listOfWar.append(nameOfBattle)
    }
}


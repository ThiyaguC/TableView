//
//  RatingUtility.swift
//  Games
//
//  Created by admin on 06/05/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

class RatingUtility {
   class func calculateValue (attckRating: Double?, dependRating: Double? ,attackStatus: String) -> (Double,Double){
        if (attckRating != nil) && (dependRating != nil) {
            var s1 = 0.0
            var s2 = 1.0
            let r1 = pow(10,(attckRating!/400))
            let r2 = pow(10,(attckRating!/400))
            let r = r1 + r2
            let e1 = r1 / r
            let e2 = r2 / r
            if (attackStatus == "win") {
                s1 = 1.0
                s2 = 0.0
            } else {
                s1 = 0.0
                s2 = 1.0
            }
           let rr1 = r1 + (32.0 * (s1 - e1))
           let rr2 = r2 + (32.0 * (s2 - e2))
            return (rr1,rr2)
        }
    return (0.0,0.0)
    }
}

class ImageUtiliy {
    static var imageDict: [String: String] = [:]
    class func setImage() {
        imageDict[KingName.Mance.rawValue] = ImageName.Mance.rawValue
        imageDict[KingName.Renly.rawValue] = ImageName.Renly.rawValue
        imageDict[KingName.Stannis.rawValue] = ImageName.Stannis.rawValue
        imageDict[KingName.Robb.rawValue] = ImageName.Stark.rawValue
        imageDict[KingName.Balon.rawValue] = ImageName.Greyjoy.rawValue
        imageDict[KingName.Joffrey.rawValue] = ImageName.Lannister.rawValue
    }
}

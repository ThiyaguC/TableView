//
//  TableViewCell.swift
//  Games
//
//  Created by admin on 06/05/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var kingSymbol: UIImageView!

    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var defenceCount: UILabel!
    @IBOutlet weak var attackCount: UILabel!
    @IBOutlet weak var winCount: UILabel!
    @IBOutlet weak var kingName: UILabel!
    
    func configureCell(king: King, imageName: String?) {
        if let name = imageName {
        self.imageView?.image = UIImage(named:name)
        }
        self.rating.text = String(format: "%.1f", king.rating)
        self.attackCount.text = "\(king.attack)"
        self.kingName.text = king.kingName
        self.winCount.text = "\(king.victoryScores)"
        self.defenceCount.text = "\(king.defend)"
    }

}

//
//  DetailViewController.swift
//  Games
//
//  Created by admin on 06/05/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: Outlet
    @IBOutlet weak var imageViewOfKing: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Varbiles
    var imageForKing: String?
    var listOfBattle: [String] = []
    
    //MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        self.imageViewOfKing.image = UIImage(named:imageForKing ?? "")
    }
}
extension DetailViewController:UITableViewDelegate,UITableViewDataSource {
    
     //MARK: Delegate Methods
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfBattle.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleCell")
        cell?.textLabel?.text = listOfBattle[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
}

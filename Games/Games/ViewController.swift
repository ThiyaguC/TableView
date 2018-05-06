//
//  ViewController.swift
//  Games
//
//  Created by admin on 05/05/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewModel: ViewModel!
    
    //MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        ImageUtiliy.setImage()
        viewModel.fetchData() {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
            if let navigationController = segue.destination as? DetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    guard let kingList = viewModel.kingList else {  return }
                    navigationController.listOfBattle = kingList[indexPath.row].listOfWar
                    navigationController.imageForKing = ImageUtiliy.imageDict[kingList[indexPath.row].kingName] ?? ""
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    //MARK: Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.noOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: StaticStrings.cellIdentifier.rawValue, for: indexPath) as? CustomTableViewCell {
            let kingDetails = viewModel.kingList![indexPath.row]
            cell.configureCell(king: kingDetails, imageName: ImageUtiliy.imageDict[kingDetails.kingName] )
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "segue", sender: cell)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


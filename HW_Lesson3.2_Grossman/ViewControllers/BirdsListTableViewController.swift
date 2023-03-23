//
//  BirdsListTableViewController.swift
//  HW_Lesson3.2_Grossman
//
//  Created by Elizabeth on 23/03/2023.
//

import UIKit

final class BirdsListTableViewController: UITableViewController {

    var birdsInfo: [Bird]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchBirds()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

private extension BirdsListTableViewController {
    func fetchBirds() {
        
    }
}

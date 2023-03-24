//
//  BirdsListTableViewController.swift
//  HW_Lesson3.2_Grossman
//
//  Created by Elizabeth on 23/03/2023.
//

import UIKit

final class BirdsListTableViewController: UITableViewController {
    
    var country: Link!
    var birdsInfo: [Bird] = []
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchBirds()
        tableView.rowHeight = 80
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        birdsInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let bird = birdsInfo[indexPath.row]
        content.text = bird.comName
        content.secondaryText = bird.locName
        cell.contentConfiguration = content
        return cell
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as? BirdInfoViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailsVC?.bird = birdsInfo[indexPath.row]
    }
}

//MARK: - Networking

private extension BirdsListTableViewController {
    func fetchBirds() {
        networkManager.fetch(_type: [Bird].self, from: country.regionUrl) { [weak self] result in
                    switch result {
                    case .success(let courses):
                        self?.birdsInfo = courses
                        DispatchQueue.main.async {
                            self?.tableView.reloadData()
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
}

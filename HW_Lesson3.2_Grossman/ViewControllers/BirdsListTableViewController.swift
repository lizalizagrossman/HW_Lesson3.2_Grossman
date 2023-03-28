//
//  BirdsListTableViewController.swift
//  HW_Lesson3.2_Grossman
//
//  Created by Elizabeth on 23/03/2023.
//

import UIKit

final class BirdsListTableViewController: UITableViewController {
    
    // MARK: - Public values
    var country: Link!
    var birdsInfo: [Bird] = []
    
    // MARK: - IBOutlets
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: - Private values
    private let networkManager = NetworkManager.shared
    
    // MARK: - Viewcontroller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchBirds()
        tableView.rowHeight = 80
        navigationController?.navigationBar.tintColor = UIColor.darkGray
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as? BirdInfoViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailsVC?.bird = birdsInfo[indexPath.row]
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
}

    //MARK: - Networking

private extension BirdsListTableViewController {
    func fetchBirds() {
        networkManager.fetchbirds(from: country.regionUrl) { [weak self] result in
            switch result {
            case .success(let birds):
                self?.birdsInfo = birds
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

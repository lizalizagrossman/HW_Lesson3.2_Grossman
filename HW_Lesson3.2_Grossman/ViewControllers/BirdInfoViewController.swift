//
//  BirdInfoViewController.swift
//  HW_Lesson3.2_Grossman
//
//  Created by Elizabeth on 23/03/2023.
//

import UIKit

final class BirdInfoViewController: UIViewController {
    
    // MARK: - Public values
    var bird: Bird!
    
    // MARK: - IBOutlets
    @IBOutlet var commonNameLabel: UILabel!
    @IBOutlet var scientificNamelabel: UILabel!
    @IBOutlet var locationNameLabel: UILabel!
    @IBOutlet var dateLastSeenLabel: UILabel!
    @IBOutlet var numberOfBirdsSeenLabel: UILabel!
    
    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitles()
        navigationItem.title = bird.comName
        navigationController?.navigationBar.tintColor = UIColor.darkGray
    }
    
    // MARK: - Private functions
    private func setTitles() {
        commonNameLabel.text = bird.comName
        scientificNamelabel.text = bird.sciName
        locationNameLabel.text = bird.locName
        dateLastSeenLabel.text = bird.obsDt
        numberOfBirdsSeenLabel.text = "\(bird.howMany ?? 0)"
    }
}
